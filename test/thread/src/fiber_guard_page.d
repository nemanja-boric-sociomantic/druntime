import core.thread;

int recurse(int i)
{
    return i == 0 ? 0 : recurse(i - 1) + i;
}

void main()
{
    enum stackSize = 4096;
    auto fib1 = new Fiber(function{ recurse(128); }, stackSize);
    // add a second fiber with a stack below the first one
    auto fib2 = new Fiber(function{}, stackSize);
    auto stackBottom1 = fib1.tupleof[8]; // m_pmem
    auto stackTop2 = fib2.tupleof[8] + fib2.tupleof[7]; // m_pmem + m_sz
    assert(stackBottom1 == stackTop2);
    fib1.call();
}
