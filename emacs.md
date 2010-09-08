<!-- -*- coding: utf-8-unix; -*-
     Danil Kutkevich's reference cards <http://kutkevich.org/rc>.
     Copyright (C) 2007, 2008, 2009, 2010 Danil Kutkevich <danil@kutkevich.org>

     This reference cards is licensed under the Creative Commons
     Attribution-Share Alike 3.0 Unported License. To view a copy of this
     license, see the COPYING file or visit
     <http://creativecommons.org/licenses/by-sa/3.0/> or send a letter to
     Creative Commons, 171 Second Street, Suite 300, San Francisco,
     California, 94105, USA. -->

Emacs
=====

<http://gnu.org/software/emacs/manual/html_mono/emacs.html>

    C = Control
    M = Meta = Alt = Esc

Basics
------

    C-x C-w
        (write-file) Write the text to an alternate name.
    C-x C-v
        Find alternate file.
    C-x i
        Insert file at cursor position.

Motion
------

    C-f
        Forward char.
    C-b
        Backward char.
    C-p
        Previous line.
    C-n
        Next line.
    M-f
        Forward one word.
    M-b
        Backward one word.
    C-a
        Beginning of line.
    C-e
        End of line.
    C-v
        One page up.
    M-v
        Scroll down one page.
    M-<
        Scroll to beginning of text.
    M->
        Scroll to end of text.
    C-u C-l
        Scroll current line to center of screen.
    M-g g
        Go to line number (goto-line).

11 Mark
-------

<http://gnu.org/software/emacs/manual/html_node/emacs/Marking-Objects.html>.

    C-x h
        (mark-whole-buffer) sets up the entire buffer as the region, by
        putting point at the beginning and the mark at the end. In some
        programs this is called "select all".

12.1 Deletion
-------------

<http://gnu.org/software/emacs/manual/html_node/emacs/Deletion.html>,
<http://emacswiki.org/DeletingWhitespace>.

    M-\
        Delete spaces and tabs around point (delete-horizontal-space).
    M-<SPC>
        Delete spaces and tabs around point, leaving one space
        (just-one-space).
    C-x C-o
        Delete blank lines around the current line (delete-blank-lines).
    M-^
        Join two lines by deleting the intervening newline, along with any
        indentation following it (delete-indentation).

Commands
--------

    C-x z
        (repeat) Repeats the previous Emacs command.
    C-u
        (universal-argument)
    C-u n
        Repeat n 4 times.
    C-u 5 n
        Repeat n 5 times.
    ESC -
        (negative-argument)

    C-t
        Transpose two chars.
    M-t
        Transpose two words.
    C-x C-t
        Transpose lines.

9.2 Editing in the Minibuffer
-----------------------------

<http://gnu.org/software/emacs/manual/html_node/emacs/Minibuffer-Edit.html>.

    C-o
    C-q C-j
        Insert a newline in the minibuffer. (The newline character is
        really the ASCII character control-J.)

Indentation
-----------

    C-M-\
        (indent-region) Indent lines in the region to the same column.
    C-x <TAB>
        (indent-rigidly) Shift lines in the region rigidly right or left.

Programming
-----------

    M-;
        Formatize and indent comment.

Important
---------

    C-x u
    C-_
    C-/
        Undo one entry of the undo records—usually, one command worth
        (undo).
    M-x recover-file RETURN
        Recover text from an autosave-file.
    M-x recover-session RETURN
        If you edited several files.

Online-Help
-----------

    C-h c
        Which command does this keystroke invoke.
    C-h k
        Which command does this keystroke invoke and what does it do?
    C-h w
        What key-combo does this command have?
    C-h f
        What does this function do.
    C-h v
        What's this variable and what is it's value.
    C-h b
        Show all keycommands for this buffer.
    C-h t
        Start the emacs tutorial.
    C-h i
        Start the info reader.

Replace
-------

    M-% string <RET> newstring <RET>
    M-x query-replace <RET> string <RET> newstring <RET>
        Replace some occurrences of string with newstring.

Search/Replace with regular expressions
---------------------------------------

`$` anchor in regexp is not allowed. Use `C-j` instead.

    M C-s RETURN
        (isearch-forward-regexp) Search for regular expression forward.
    M C-r RETURN
        (isearch-backward-regexp) Search for regular expression backward.
    M-x list-matching-lines
        Lines in a buffer that match regexp.
    M-x replace-regexp <RET> regexp <RET> newstring <RET>
        Replace every match for regexp with newstring.
    M-x query-replace-regexp <RET> regexp <RET> newstring <RET>
        Replace some matches for regexp with newstring.
            \<
                beginning of a word
            \>
                end of a word
    M-x apropos
        Finding a command by a regular expression.

[Window commands][]
-----------------

<http://gnu.org/software/emacs/manual/html_node/emacs/Change-Window.html>

    C-x 2
        (split-window-vertically)
    C-x 3
        (split-window-horizontally)
    C-x ^
        (enlarge-window)
    C-u - C-x ^
        (shrink-window)
    C-x }
        (enlarge-window-horizontally)
    C-x {
        (shrink-window-horizontally)
    C-x +
        Make all windows the same height and width (balance-windows)
    M C-v
        Scroll other window
    C-x 4 f
        Find file in other window
    C-x 4 0
        Kill buffer and window

[Window commands]: http://gnu.org/software/emacs/manual/html_node/emacs/Windows.html

Variables
---------

    M-x set-variable <RET> var <RET> value <RET>
        Set variable.
    M-x indent-tabs-mode

Frame commands
--------------

    C-x 5 1
        Delete all frames except the selected one.
    C-x 5 f
        Find file in other frame.

Bookmark commands
-----------------

    C-x r m
        Set a bookmark at current cursor pos.
    C-x r b
        Jump to bookmark.
    M-x bookmark-rename
    M-x bookmark-delete
    M-x bookmark-save
    C-x r l
        List bookmarks.
    M-x bookmark-write
        Write all bookmarks in given file.
    M-x bookmark-load
        Load bookmark from given file.

Bookmark window commands
------------------------

    d
        Mark bookmark for deletion.
    r
        Rename bookmark.
    s
        Save all listed bookmarks.
    f
        Show bookmark the cursor is over.
    m
        Mark bookmarks to be shown in multiple window.
    v
        Show marked bookmarks (or the one the cursor is over).
    t
        Toggle listing of the corresponding paths.
    w
        Path to this file.
    x
        Delete marked bookmarks.
    q
        Quit bookmark list.

27.11 Specifying a Coding System for File Text
----------------------------------------------

<http://gnu.org/software/emacs/manual/html_node/emacs/Text-Coding.html#Text-Coding>

    C-x <RET> r coding <RET>
        Revisit the current file using the coding system coding
        (revert-buffer-with-coding-system).
    C-x <RET> k coding <RET>
        Use coding system coding for keyboard input
        (set-keyboard-coding-system).

23.13 Accessing Compressed Files
--------------------------------

<http://gnu.org/software/emacs/manual/html_node/emacs/Compressed-Files.html>

    M-x auto-compression-mode

Dired (DIRectory EDitor)
------------------------

<http://gnu.org/software/emacs/manual/html_node/emacs/Dired.html>.

    M-x speedbar
        Starts up a separate window with a directory view.
    G
        Change group permissions (chgrp).
    v
        View file content.
    Z
        Compress file.
    m
    * m
        Mark the current file with `*' (dired-mark). With a numeric
        argument n, mark the next n files starting with the current
        file. (If n is negative, mark the previous −n files.)
    u
    * u
        Remove any mark on this line (dired-unmark).
    ~
        Mark backup files (name~ files) for deletion.
    #
        Mark auto-save files (#name#) for deletion.
    * /
        Mark with `*' all files which are directories, except for
        . and .. (dired-mark-directories). With a numeric argument,
        unmark all those files.
    C-u * /
        Removes that mark again.
    * s
        Mark all the files in the current subdirectory, aside from `.`
        and `..` (dired-mark-subdir-files).
    * !
    U
         Remove all marks from all the files in this Dired buffer
         (`dired-unmark-all-marks').
    M-<DEL>
        Remove all marks that use the character markchar
        (dired-unmark-all-files). The argument is a single character—do
        not use <RET> to terminate it. See the description of the * c
        command below, which lets you replace one mark character with
        another.

        With a numeric argument, this command queries about each marked
        file, asking whether to remove its mark. You can answer y meaning
        yes, n meaning no, or ! to remove the marks from the remaining
        files without asking about them.
    t
    * t
        Toggle all marks (dired-toggle-marks): files marked with `*'
        become unmarked, and unmarked files are marked with `*'. Files
        marked in any other way are not affected.
    =
        Compare this file.
    M-=
        Compare this file with it's backup file.

    % m regexp <RET>
    * % regexp <RET>

Mark (with `*`) all files whose names match the regular expression
regexp (dired-mark-files-regexp). This command is like % d, except
that it marks files with `*` instead of flagging with `D`.

Only the non-directory part of the file name is used in
matching. Use `^` and `$` to anchor matches. You can exclude
subdirectories by temporarily hiding them (see Hiding Subdirectories).

    C-u * % regexp <RET>

Unmark by regexp

    C-x u
    C-_
    C-/
        Undo changes in the Dired buffer, such as adding or removing marks
        (dired-undo). This command does not revert the actual file
        operations, nor recover lost files! It just undoes changes in the
        buffer itself.

        In some cases, using this after commands that operate on files can
        cause trouble. For example, after renaming one or more files,
        dired-undo restores the original names in the Dired buffer, which
        gets the Dired buffer out of sync with the actual contents of the
        directory.
    >
        Changed to next dir.
    <
        Change to previous dir.
    C-u s SWITCHES <RET>
        Refresh the Dired buffer using SWITCHES as
        dired-listing-switches.

### (find-dired)

    M-x find-dired <RET> ~/ <RET> -type f -iname "*.rb" -size -100k \
                                  -exec grep -q -e danil\\.kutkevich \{\} \;

Find and list files inside a directory, including subdirectories.

Operating on Files
------------------

<http://gnu.org/software/emacs/manual/html_node/emacs/Operating-on-Files.html>.

    A regexp <RET>
        Search all the specified files for the regular expression regexp
        (dired-do-search).
        This command is a variant of tags-search. The search stops at the
        first match it finds; use M-, to resume the search and find the
        next match. See Tags Search.
    Q regexp <RET> to <RET>
        Perform query-replace-regexp on each of the specified files,
        replacing matches for regexp with the string to
        (dired-do-query-replace-regexp).
        This command is a variant of tags-query-replace. If you exit the
        query replace loop, you can use M-, to resume the scan and replace
        more matches. See Tags Search.

37.8 Shell Commands in Dired
----------------------------

### dired-do-shell-command

    !

Runs tar on the entire list of file names, putting them into one tar
file foo.tar:

    ! tar cf foo.tar * <RET>

Buffer List
-----------

    C-d
        Request to delete and move up afterwards instead of down.
    s
        Request to save the buffer. The request shows as an `S' on the
        line. Requested saves take place when you type the x command. You
        may request both saving and deletion for the same buffer.
    o
        Immediately select this line's buffer in another window as if by
        C-x 4 b, leaving `*Buffer List*' visible.
    C-o
        Immediately display this line's buffer in another window, but
        don't select the window.
    b
        Bury the buffer listed on this line.

Shell
-----

    M-x shell
        Start a shell in window *shell*.
    C-c C-u
        Kill all text pending at end of buffer to be sent as input
        (comint-kill-input).
    C-c C-w
        Kill a word before point (backward-kill-word).
    C-c C-c
        Stop running job.
    C-d
        Delete char forward.
    C-c C-d
        Send EOF.
    C-c C-z
        Suspend job (C-z under unix).
    M-p
        Fetch the next earlier old shell command.
    M-n
        Fetch the next later old shell command.
    M-r regexp <RET>
    M-s regexp <RET>
        Search backwards or forwards for old shell commands that match
        regexp.

41.9 Term Mode
--------------

<http://gnu.org/software/emacs/manual/html_node/emacs/Term-Mode.html>

    C-c C-j
        Switch to line mode.

    C-c C-k
        Switch to char mode.

The following commands are only available in char mode:

    C-c C-c
        Send a literal <C-c> to the sub-shell.


Text
----

    M-x text-mode
        Mode for editing text files.
    M-s
        Center line.
    M-S
        Center paragraph.
    M-x
        Center-region name says.

Macro-command
-------------

    C-x (
        Start macro definition.
    C-x )
        End of macro definition.
    C-x e
        (call-last-kbd-macro) Execute last definied macro.
    M-n C-x e
        Execute last defined macro n times.
    M-x name-last-kbd-macro
        Give name to macro (for saving).
    M-x insert-keyboard-macro
        Save named macro into file.
    M-x load-file
        Load macro.
    M-x macroname
        Execute macroname.

C, C++, PHP and Java Modes
--------------------------

    M-a
        Beginning of statement.
    M-e
        End of statement.
    M C-a
        Beginning of function.
    M C-e
        End of function.
    C-c C-q
        Indent the whole function according to indention style.
    C-c C-a
        Toggle modus in which after electric signs (like {}:';./*) emacs
        does the indention.
    C-c C-d
        Toggle auto hungry mode in which emacs deletes groups of spaces
        with one del-press.
    C-c C-u
        Go to beginning of this preprocessor statement.
    C-c C-c (comment-region)
        This command comments out the lines that start in the region. With
        a negative argument, it does the opposite - it deletes the comment
        delimiters from these lines. See Multi-Line Comments, for fuller
        details. comment-region isn't actually part of CC Mode - it is
        given a CC Mode binding for convenience.
    M-x uncomment-region

More general
------------

    M-x outline-minor-mode
        Collapses function definitions in a file to a mere {...}.
    M-x show-subtree
        If you are in one of the collapsed functions, this un-collapses it.

GDB (debugger)
--------------

    M-x gdb
        Starts up gdm in an extra window.

Filling Text
------------

<http://gnu.org/software/emacs/manual/html_node/emacs/Filling.html>.

    M-x auto-fill-mode
        Enable or disable Auto Fill mode. Breaking happens only when you
        type a <SPC> or <RET>.
    C-x f
        Set the fill column (set-fill-column). 70 characters by default.
    C-x .
        Set the fill prefix (set-fill-prefix).
    M-q
        Fill current paragraph (fill-paragraph).
    M-x fill-region
        Fill each paragraph in the region (fill-region).

Version Control (vc.el)
-----------------------

<http://gnu.org/software/emacs/manual/html_node/emacs/Version-Control.html>

    C-x C-q
        Commit to CVS.
    C-x v d
        Creates a buffer which uses VC Dired Mode (shows only locked or
        not up-to-date files) (vc-directory).
    C-x v =
        Show a diff from the previous version.
    C-x v i
        Register a file for version control. Bound to vc-register.
    C-x v v
        Commits a modified file that's already been registered for version
        control. Use C-c C-c to save the revision comment and commit the
        change. Bound to vc-next-act.
    C-x v u
        Revert a buffer to the last revision. Bound to vc-revert-buffer.
    C-u C-x v =
        See differences between two revisions of a file.  You'll be
        prompted for file, starting revision, and ending revision.
        Specify the revision s either by revision number or by label.
        Bound to vc-diff.
    C-x v ~
        Retreive a given revision in another window. You'll be prompted
        for the a revision. Bound to vc-version-other-window.
    C-x v l
        See revision history. Bound to vc-print-log.
    C-x v s
        Label a tree (a.k.a. Creating a snapshot). You'll be prompted
        for a label name. Bound to vc-create-snapshot.
    C-x v r
        Retreive file names from a labeled snapshot. You'll be prompted
        for a label name. This checks out every registered file underneath
        the current directory, which might not be what you want to do.
        Bound to vc-retreive-snapshot.
    C-x v h
        Insert version control header into file.
    C-x v a
        Create changelog file in gnu-style.

PCL-CVS
-------

<http://gnu.org/software/emacs/manual/html_mono/pcl-cvs.html>.

    M-x cvs-update
        Run a `cvs update' command. You will be asked for the directory
        in which the `cvs update' will be run.
    M-x cvs-examine
        Run a `cvs -n update' command. This is identical to the previous
        command, except that it will only check what needs to be done
        but will not change anything. You will be asked for the directory
        in which the `cvs -n update' will be run.
    M-x cvs-status
        Run a `cvs status' command. You will be asked for the directory
        in which the `cvs status' will be run.
    M-x cvs-checkout
        Run a `cvs checkout' command. You will be asked for the directory
        in which the `cvs update' will be run and the module to be
        checked out.
    M-x cvs-quickdir
        Populate the `*cvs*' buffer by just looking at the CVS/Entries
        files. This is very much like cvs-examine except that it does not
        access the CVS repository, which is a major advantage when the
        repository is far away. But of course, it will not be able to
        detect when a file needs to be updated or merged.

Subversion
----------

<http://emacswiki.org/SvnStatusMode>,
<http://svn.apache.org/repos/asf/subversion/trunk/contrib/client-side/emacs/psvn.el>

Tags
----

### (find-tag)

<http://gnu.org/software/emacs/manual/html_node/emacs/Find-Tag.html>

Find first definition of tag

    M-.

Find next alternate definition of last tag specified

    C-u M-.

Go back to previous tag found

    C-u - M-.


### (pop-tag-mark)

Jump back

    M-*

### (tags-search)

<http://gnu.org/software/emacs/manual/html_node/emacs/Tags-Search.html>

Search for regexp through the files in the selected tags table

### (tags-query-replace)

Perform a query-replace-regexp on each file in the selected tags table

### (tags-loop-continue)

Restart `tags-search` or `tags-query-replace`, from the current
location of point (Meta comma)

    M-,

### (tags-apropos)

List all tags in a tags file that match a regexp

### (list-tags)

List all tags defined in a source file

Whitespace-manipulation
-----------------------

### (delete-blank-lines)

    C-x C-o

[Spelling][]
----------

### (ispell-word)

Check and correct spelling of the active region or the word at point

    M-$

### (ispell)

Check and correct spelling in the active region or the entire buffer.

### (ispell-buffer)

Check and correct spelling in the buffer.

### (ispell-region)

Check and correct spelling in the region.

### (ispell-message)

Check and correct spelling in a draft mail message, excluding cited
material.

### (ispell-change-dictionary)

Restart the Aspell/Ispell/Hunspell process, using dict as the
dictionary.

    M-x ispell-change-dictionary <RET> dict <RET>

### (ispell-kill-ispell)

Kill the Aspell/Ispell/Hunspell subprocess.

[Spelling]: http://gnu.org/software/emacs/manual/html_node/emacs/Spelling.html

Local Variables in Files
------------------------

[Local Variables in Files]: http://gnu.org/software/emacs/manual/html_node/emacs/File-Variables.html

    /* Local Variables: */
    /* mode:c           */
    /* comment-column:0 */
    /* End:             */

### First line

    # -*- coding: utf-8-unix; -*-


### Local variables list

    # Local Variables:
    # truncate-lines: t
    # End:

Other
-----

    C-x ;
    C-x l
    M-x toggle-truncate-lines
    M-x font-lock-mode
        Highlights (or “fontifies”) the buffer contents according to the
        syntax of the text you are editing.
    M-x eshell
    M-x describe-bindings
        View all the Buffer-menu key bindings.
    M-x describe-key
    M-x list-colors-display
    M-x nxml-mode
        Mode for editing XML documents.
    M-x picture-mode
        Draw ascii art.
    M-x calc
    M-x calendar
    M-x set-language-environment
    M-x save-some-buffers
        Display each unsaved file and ask if you want it saved.
    M-x list-colors-display
    M-x kill-emacs
        To kill the Emacs process, when Emacs is started as a daemon.
    C-x h
        (mark-whole-buffer)
    M-x load-file RET ~/.emacs RET
        Execute a file of Emacs Lisp code (reload .emacs without
        restarting for example) ([load-file][])

[load-file]: http://gnu.org/software/emacs/manual/html_node/emacs/Lisp-Libraries.html#index-load_002dfile-2360

### (normal-mode)

Choose the major mode for this buffer automatically

### (toggle-read-only)

    C-x C-q

Toggle read-only status of buffer
<http://gnu.org/software/emacs/manual/html_node/emacs/Misc-Buffer.html>.

Interactively Do Things
-----------------------

### (ido-edit-input function)

    C-e
