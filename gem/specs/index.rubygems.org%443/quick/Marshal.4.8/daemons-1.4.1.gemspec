u:Gem::Specification?[I"
3.0.3:ETi	I"daemons; TU:Gem::Version[I"
1.4.1; TIu:	Time@_?    :	zoneI"UTC; FI">A toolkit to create and control daemons in different ways; TU:Gem::Requirement[[[I">=; TU;[I"0; TU;	[[[I">=; TU;[I"0; TI"	ruby; T[	o:Gem::Dependency
:
@nameI"	rake; T:@requirementU;	[[[I"~>; TU;[I"	12.3; T[I">=; TU;[I"12.3.3; T:
@type:development:@prereleaseF:@version_requirementsU;	[[[I"~>; TU;[I"	12.3; T[I">=; TU;[I"12.3.3; To;

;I"
rspec; T;U;	[[[I"~>; TU;[I"3.1; T;;;F;U;	[[[I"~>; TU;[I"3.1; To;

;I"simplecov; T;U;	[[[I"~>; TU;[I"0; T;;;F;U;	[[[I"~>; TU;[I"0; To;

;I"pry-byebug; T;U;	[[[I"~>; TU;[I"3.0; T;;;F;U;	[[[I"~>; TU;[I"3.0; TI" ; TI"thomas.uehinger@gmail.com; T[I"Thomas Uehlinger; TI"    Daemons provides an easy way to wrap existing ruby scripts (for example a
    self-written server)  to be run as a daemon and to be controlled by simple
    start/stop/restart commands.

    You can also call blocks as daemons and control them from the parent or just
    daemonize the current process.

    Besides this basic functionality, daemons offers many advanced features like
    exception backtracing and logging (in case your ruby script crashes) and
    monitoring and automatic restarting of your processes if they crash.
; TI"+https://github.com/thuehlinger/daemons; TT@[I"MIT; T{I"documentation_uri; TI")http://www.rubydoc.info/gems/daemons; T