include ../common.mak

TESTS:=fiber_guard_page

.PHONY: all clean
all: $(addprefix $(ROOT)/,$(addsuffix .done,$(TESTS)))

# segfaults
$(ROOT)/fiber_guard_page.done: $(ROOT)/%.done : $(ROOT)/%
	@echo Testing $*
	$(QUIET)$(TIMELIMIT)$(ROOT)/$* $(RUN_ARGS) &>/dev/null; [ $$? -eq 139 ]
	@touch $@

$(ROOT)/%: $(SRC)/%.d
	$(QUIET)$(DMD) $(DFLAGS) -of$@ $<

clean:
	rm -rf $(GENERATED)
