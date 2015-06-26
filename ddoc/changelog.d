/++
Scriptlike_Changelog:

(Dates below are YYYY/MM/DD)

$(H2 v0.8.2 - TBD)

$(UL
	$(CHANGE Convert changelog from markdown to $(DDOX) so links are more readable. )
	$(ENHANCE Add (opt-in) command echoing to most functions in scriptlike.file. )
	$(ENHANCE
		Add $(API_FILE yap) and $(API_FILE yapFunc) as improved versions
		of to-be-deprecated $(API_FILE echoCommand).
	)
	$(FIXED Make $(API_PATH escapeShellArg) const-correct. )
)

$(H2 v0.8.1 - 2015/06/22)

$(UL
	$(ENHANCE
		New overload for $(API_INTERACT userInput) to allow type inference:$(BR)
		`void userInput(T=string)(string question, ref T result);`
		(suggestion from
		$(LINK2 http://forum.dlang.org/post/povoxkcogcmbvhwlxqbc@forum.dlang.org, Per Nordlöw)).
	)
)

$(H2 v0.8.0 - 2015/06/13)

$(UL
	$(CHANGE
		Minimum officially supported $(DMD) increased from v2.064.2 to v2.066.0.
		Versions below v2.066.0 may still work, but there will now be certain
		problems when dealing with paths that contain spaces, particularly
		on Windows.
	)
	$(CHANGE
		Removed unnecessary non-$(API_PATH Path) wrappers around $(MODULE_STD_FILE)/$(MODULE_STD_PATH).
		Things not wrapped (like $(STD_PATH dirSeparator) and $(STD_FILE SpanMode))
		are now selective public imports instead of aliases. These changes should
		reduce issues with symbol conflicts.
	)
	$(CHANGE
		$(LINK2 http://semitwist.com/scriptlike/, API reference) now built
		using $(DDOX) and uses much improved styling (actually uses a stylesheet now).
	)
	$(CHANGE
		Eliminate remnants of the "planned but never enabled" wstring/dstring
		versions of $(API_PATH Path)/$(API_PATH Ext)/$(API_PROCESS Args). There
		turned out not to be much need for them, and even $(MODULE_STD_FILE)
		doesn't support wstring/dstring either.
	)
	$(CHANGE Put output binaries in "bin" subdirectory, instead of Scriptlike's root. )
	$(ENHANCE
		Add module scriptlike.only to import all of scriptlike, but omit the
		helper Phobos imports in scriptlike.std.
	)
	$(ENHANCE
		$(API_FAIL fail) now accepts an arbitrary list of args of any type,
		just like $(STD_STDIO writeln),
	)
	$(ENHANCE
		Added $(API_FAIL failEnforce), like Phobos's $(STD_EXCEPTION enforce),
		but for $(API_FAIL fail).
	)
	$(ENHANCE
		Added $(API_PROCESS runCollect and $(API_PROCESS tryRunCollect), to
		capture a command's output instead of displaying it.
	)
	$(ENHANCE Added $(API_INTERACT pause) to pause and prompt the user to press Enter. )
	$(ENHANCE $(API_FILE echoCommand) is no longer private. )
	$(ENHANCE
		Added $(API_PATH Path)-based wrappers for $(MODULE_STD_FILE)'s 
		$(STD_FILE getcwd), $(STD_FILE thisExePath) and $(STD_FILE tempDir).
	)
	$(FIXED No longer uses the Phobos's deprecated $(STD_PROCESS system).)
	)
)

$(H2 v0.7.0 - 2015/04/02)

$(UL
	$(ENHANCE
		$(ISSUE 14): Added scriptlike.interact module for easy user-input prompts.
		(Thanks to $(LINK2 https://github.com/JesseKPhillips, Jesse Phillips))
	)
	$(FIXED Unittest compile failure on $(DMD) v2.067.0. )
)

$(H2 v0.6.0 - 2014/02/16)

$(UL
	$(CHANGE
		$(API_PATH Path) and $(API_PATH Ext) are now aliases for the UTF-8
		instantiations, and the template structs are now named `PathT` and `ExtT`.
	)
	$(CHANGE
		Removed `path()` and `ext()` helper functions to free up useful names
		from the namespace, since they are no longer needed. Use `Path()` and
		`Ext()` instead.
	)
	$(CHANGE
		Internally split into separate modules, but uses `package.d` to
		preserve `import scriptlike;`.
	)
	$(CHANGE Rename `escapeShellPath` -> $(API_PATH escapeShellArg). )
	$(CHANGE
		Rename $(API_PATH runShell) -> $(API_PROCESS tryRun). Temporarily keep
		$(API_PATH runShell) as an alias.
	)
	$(CHANGE
		Rename $(API_PATH scriptlikeTraceCommands) -> $(API_FILE scriptlikeEcho).
		Temporarily keep $(API_PATH scriptlikeTraceCommands) as an alias.
	)
	$(ENHANCE Added scripts to run unittests and build API docs. )
	$(ENHANCE
		Added $(API_PATH_PATH Path.opCast) and $(API_PATH_EXT Ext.opCast) for
		converting to bool.
	)
	$(ENHANCE
		$(API_FAIL fail) no longer requires any boilerplate in `main()`.
		($(LINK2 http://forum.dlang.org/thread/ldc6qt$22tv$1@digitalmars.com, Newsgroup link))
	)
	$(ENHANCE
		Added $(API_PROCESS run) to run a shell command like $(API_PROCESS tryRun),
		but automatically throw if the process returns a non-zero error level.
	)
	$(ENHANCE $(ISSUE 2): Optional callback sink for command echoing: $(API_FILE scriptlikeCustomEcho). )
	$(ENHANCE $(ISSUE 8): Dry run support via bool $(API_FILE scriptlikeDryRun). )
	$(ENHANCE
		$(ISSUE 13): Added `ArgsT` (and $(API_PROCESS Args) helper alias)
		to safely build command strings from parts.
	)
	$(ENHANCE Added this changelog. )
	$(FIXED
		$(API_PATH Path)(null) and $(API_PATH Ext)(null) were automatically
		changed to empty string.
	)
	$(FIXED $(ISSUE 10): Docs should include all OS-specific functions. )
)

$(H2 v0.5.0 - 2014/02/11)

$(UL
	$(LI Initial release. )
)

Copyright:
Copyright (C) 2014-2015 Nick Sabalausky.
Portions Copyright (C) 2010 Jesse Phillips.

License: zlib/libpng
Authors: Nick Sabalausky, Jesse Phillips
+/
module changelog;