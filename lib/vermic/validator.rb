# This module validates the parameters' values
# for the correctness
#
module Validator
  
  # Hash of possible code formats
  FORMATS_HASH = {
    "4cs" => "4CS",
    "6502acme" => "6502 ACME Cross Assembler",
    "6502kickass" => "6502 Kick Assembler",
    "6502tasm" => "6502 TASM/64TASS",
    "abap" => "ABAP",
    "actionscript" => "ActionScript",
    "actionscript3" => "ActionScript 3",
    "ada" => "Ada",
    "algol68" => "ALGOL 68",
    "apache" => "Apache Log",
    "applescript" => "AppleScript",
    "apt_sources" => "APT Sources",
    "asm" => "ASM (NASM)",
    "asp" => "ASP",
    "autoconf" => "autoconf",
    "autohotkey" => "Autohotkey",
    "autoit" => "AutoIt",
    "avisynth" => "Avisynth",
    "awk" => "Awk",
    "bascomavr" => "BASCOM AVR",
    "bash" => "Bash",
    "basic4gl" => "Basic4GL",
    "bibtex" => "BibTeX",
    "blitzbasic" => "Blitz Basic",
    "bnf" => "BNF",
    "boo" => "BOO",
    "bf" => "BrainFuck",
    "c" => "C",
    "c_mac" => "C for Macs",
    "cil" => "C Intermediate Language",
    "csharp" => "C#",
    "cpp" => "C++",
    "cpp-qt" => "C++ (with QT extensions)",
    "c_loadrunner" => "C: Loadrunner",
    "caddcl" => "CAD DCL",
    "cadlisp" => "CAD Lisp",
    "cfdg" => "CFDG",
    "chaiscript" => "ChaiScript",
    "clojure" => "Clojure",
    "klonec" => "Clone C",
    "klonecpp" => "Clone C++",
    "cmake" => "CMake",
    "cobol" => "COBOL",
    "coffeescript" => "CoffeeScript",
    "cfm" => "ColdFusion",
    "css" => "CSS",
    "cuesheet" => "Cuesheet",
    "d" => "D",
    "dcs" => "DCS",
    "delphi" => "Delphi",
    "oxygene" => "Delphi Prism (Oxygene)",
    "diff" => "Diff",
    "div" => "DIV",
    "dos" => "DOS",
    "dot" => "DOT",
    "e" => "E",
    "ecmascript" => "ECMAScript",
    "eiffel" => "Eiffel",
    "email" => "Email",
    "epc" => "EPC",
    "erlang" => "Erlang",
    "fsharp" => "F#",
    "falcon" => "Falcon",
    "fo" => "FO Language",
    "f1" => "Formula One",
    "fortran" => "Fortran",
    "freebasic" => "FreeBasic",
    "freeswitch" => "FreeSWITCH",
    "gambas" => "GAMBAS",
    "gml" => "Game Maker",
    "gdb" => "GDB",
    "genero" => "Genero",
    "genie" => "Genie",
    "gettext" => "GetText",
    "go" => "Go",
    "groovy" => "Groovy",
    "gwbasic" => "GwBasic",
    "haskell" => "Haskell",
    "hicest" => "HicEst",
    "hq9plus" => "HQ9 Plus",
    "html4strict" => "HTML",
    "html5" => "HTML 5",
    "icon" => "Icon",
    "idl" => "IDL",
    "ini" => "INI file",
    "inno" => "Inno Script",
    "intercal" => "INTERCAL",
    "io" => "IO",
    "j" => "J",
    "java" => "Java",
    "java5" => "Java 5",
    "javascript" => "JavaScript",
    "jquery" => "jQuery",
    "kixtart" => "KiXtart",
    "latex" => "Latex",
    "lb" => "Liberty BASIC",
    "lsl2" => "Linden Scripting",
    "lisp" => "Lisp",
    "llvm" => "LLVM",
    "locobasic" => "Loco Basic",
    "logtalk" => "Logtalk",
    "lolcode" => "LOL Code",
    "lotusformulas" => "Lotus Formulas",
    "lotusscript" => "Lotus Script",
    "lscript" => "LScript",
    "lua" => "Lua",
    "m68k" => "M68000 Assembler",
    "magiksf" => "MagikSF",
    "make" => "Make",
    "mapbasic" => "MapBasic",
    "matlab" => "MatLab",
    "mirc" => "mIRC",
    "mmix" => "MIX Assembler",
    "modula2" => "Modula 2",
    "modula3" => "Modula 3",
    "68000devpac" => "Motorola 68000 HiSoft Dev",
    "mpasm" => "MPASM",
    "mxml" => "MXML",
    "mysql" => "MySQL",
    "newlisp" => "newLISP",
    "text" => "None",
    "nsis" => "NullSoft Installer",
    "oberon2" => "Oberon 2",
    "objeck" => "Objeck Programming Langua",
    "objc" => "Objective C",
    "ocaml-brief" => "OCalm Brief",
    "ocaml" => "OCaml",
    "pf" => "OpenBSD PACKET FILTER",
    "glsl" => "OpenGL Shading",
    "oobas" => "Openoffice BASIC",
    "oracle11" => "Oracle 11",
    "oracle8" => "Oracle 8",
    "oz" => "Oz",
    "pascal" => "Pascal",
    "pawn" => "PAWN",
    "pcre" => "PCRE",
    "per" => "Per",
    "perl" => "Perl",
    "perl6" => "Perl 6",
    "php" => "PHP",
    "php-brief" => "PHP Brief",
    "pic16" => "Pic 16",
    "pike" => "Pike",
    "pixelbender" => "Pixel Bender",
    "plsql" => "PL/SQL",
    "postgresql" => "PostgreSQL",
    "povray" => "POV-Ray",
    "powershell" => "Power Shell",
    "powerbuilder" => "PowerBuilder",
    "proftpd" => "ProFTPd",
    "progress" => "Progress",
    "prolog" => "Prolog",
    "properties" => "Properties",
    "providex" => "ProvideX",
    "purebasic" => "PureBasic",
    "pycon" => "PyCon",
    "python" => "Python",
    "q" => "q/kdb+",
    "qbasic" => "QBasic",
    "rsplus" => "R",
    "rails" => "Rails",
    "rebol" => "REBOL",
    "reg" => "REG",
    "robots" => "Robots",
    "rpmspec" => "RPM Spec",
    "ruby" => "Ruby",
    "gnuplot" => "Ruby Gnuplot",
    "sas" => "SAS",
    "scala" => "Scala",
    "scheme" => "Scheme",
    "scilab" => "Scilab",
    "sdlbasic" => "SdlBasic",
    "smalltalk" => "Smalltalk",
    "smarty" => "Smarty",
    "sql" => "SQL",
    "systemverilog" => "SystemVerilog",
    "tsql" => "T-SQL",
    "tcl" => "TCL",
    "teraterm" => "Tera Term",
    "thinbasic" => "thinBasic",
    "typoscript" => "TypoScript",
    "unicon" => "Unicon",
    "uscript" => "UnrealScript",
    "vala" => "Vala",
    "vbnet" => "VB.NET",
    "verilog" => "VeriLog",
    "vhdl" => "VHDL",
    "vim" => "VIM",
    "visualprolog" => "Visual Pro Log",
    "vb" => "VisualBasic",
    "visualfoxpro" => "VisualFoxPro",
    "whitespace" => "WhiteSpace",
    "whois" => "WHOIS",
    "winbatch" => "Winbatch",
    "xbasic" => "XBasic",
    "xml" => "XML",
    "xorg_conf" => "Xorg Config",
    "xpp" => "XPP",
    "yaml" => "YAML",
    "z80" => "Z80 Assembler",
    "zxbasic" => "ZXBasic"
  }

  # Hash of possible expire date values
  EXPIRE_DATE_HASH = {
    "N" => "Never",
    "10M" => "10 Minutes",
    "1H" => "1 Hour",
    "1D" => "1 Day",
    "1M" => "1 Month"
  }

  # Validates all the options which exist in the 
  # options array(defined by the user)
  #
  def self.validate_options(options = {})
    @errors = []
    validate_name(options[:paste_name]) if options.has_key?(:paste_name)
    validate_format(options[:paste_format]) if options.has_key?(:paste_format)
    validate_expire_date(options[:paste_expire_date]) if options.has_key?(:paste_expire_date)
    validate_file(options[:file_name])
  end

  # Checks if the options have any errors
  #
  def self.any_errors?
    !@errors.empty?
  end

  # Prints all the errors of all options
  # to the shell
  #
  def self.print_errors
    @errors.each do |e|
      puts e
    end
  end

  private
  
  # Validates the name of the paste
  #
  def self.validate_name(name)
     @errors << "Name can't be empty" if name.empty?
  end

  # Validates the format of the paste
  #
  def self.validate_format(format)
    if !FORMATS_HASH.has_key?(format)
      @errors << "Wrong format" 
      FORMATS_HASH.keys.each do |key|
        @errors << "\t#{key} -> #{FORMATS_HASH[key]}"
      end
    end
  end

  # Validates the expire date of the paste
  #
  def self.validate_expire_date(expire_date)
    if !EXPIRE_DATE_HASH.has_key?(expire_date)
      @errors << "Wrong format of expire date, you should use the following arguments:"   
      EXPIRE_DATE_HASH.keys.each do |key|
        @errors << "\t#{key.to_s} -> #{EXPIRE_DATE_HASH[key]}"
      end
    end
  end

  # Validates the file
  #
  def self.validate_file(filename)
    if filename.nil?
      @errors << "But you didn't provide the file"
    else
      @errors << "There's no such file" if !File.exists?(filename)
    end
  end
end
