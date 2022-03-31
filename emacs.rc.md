# Emacs

https://www.gnu.org/software/emacs/history.html

## Cask

    curl -fsSL https://raw.githubusercontent.com/cask/cask/master/go | python
    cd ~/.emacs.d && cask install

## Compile source code and run without X11

<http://www.emacswiki.org/emacs/BuildingEmacs>

    ./configure --prefix="$HOME"/.local/usr/local \
                --with-x-toolkit=no \
                --with-xpm=no \
                --with-jpeg=no \
                --with-png=no \
                --with-gif=no \
                --with-tiff=no \
                && make --jobs=2 \
                && make install
    cd ~/.emacs.d && cask install
    emacs -nw

## Troubleshooting: Compile Emacs 27.1/27.2 error: `static unsigned char sigsegv_stack[SIGSTKSZ]`

<https://www.reddit.com/r/emacs/comments/q99ygd/emacs_272_doesnt_compile_in_kubuntu_2110/>

## (write-file)

Save the current buffer with a specified file name (write-file)  

    C-x C-w

## Delete blank lines

<http://gnu.org/software/emacs/manual/html_node/emacs/Deletion.html>,
<http://emacswiki.org/DeletingWhitespace>,
<http://emacswiki.org/EmacsNiftyTricks#toc11>.

`C-x C-o` Delete blank lines around the current line (delete-blank-lines)

## Search/Replace with regular expressions

`$` anchor in regexp is not allowed. Use `C-j` instead.

    M C-s RETURN
        (isearch-forward-regexp) Search for regular expression forward.
    M C-r RETURN
        (isearch-backward-regexp) Search for regular expression backward.
    M-x list-matching-lines
        Lines in a buffer that match regexp.
    M-x replace-regexp <RET> {{\([^}]*\)}} <RET> %{\1} <RET>
        Replace every match for regexp with newstring.
    M-x query-replace-regexp <RET> regexp <RET> newstring <RET>
        Replace some matches for regexp with newstring.
            \<
                beginning of a word
            \>
                end of a word
    M-x apropos
        Finding a command by a regular expression.

### (ibuffer-do-occur)

Do an occur on the selected buffers

In Ibuffer mode <http://emacswiki.org/emacs/IbufferMode>,
<http://emacsmirror.org/package/ibuffer.html>:

    O

### (find-grep)

<http://gnu.org/software/emacs/manual/html_node/emacs/Dired-and-Find.html>,
<http://gnu.org/software/emacs/manual/html_node/emacs/Grep-Searching.html>.

## [Window commands][]

<http://gnu.org/software/emacs/manual/html_node/emacs/Change-Window.html>

    M C-v
        Scroll other window
    C-x 4 f
        Find file in other window

[Window commands]: http://gnu.org/software/emacs/manual/html_node/emacs/Windows.html

## Specifying a coding system for file text

Charset encoding.

<http://gnu.org/software/emacs/manual/html_node/emacs/Text-Coding.html#Text-Coding>
<http://stackoverflow.com/questions/2750352/how-to-change-buffer-coding-system-in-emacs#2750366>.

    C-x <RET> r coding <RET>
        Revisit the current file using the coding system (eg windows-1251)
        (revert-buffer-with-coding-system).

    C-x <RET> k coding <RET>
        Use coding system coding for keyboard input
        (set-keyboard-coding-system).

## Dired (DIRectory EDitor)

    * !
         Remove all marks from all the files in this Dired buffer
         (`dired-unmark-all-marks').
    * t
        Toggle all marks (dired-toggle-marks): files marked with `*'
        become unmarked, and unmarked files are marked with `*'. Files
        marked in any other way are not affected.
    * % regexp <RET>

### (find-dired)

    M-x find-dired <RET> ~/ <RET> -type f -iname "*.rb" -size -100k \
                                  -exec grep -q -e danil\\.kutkevich \{\} \;

Find and list files inside a directory, including subdirectories.

### (find-grep-dired)

Test the contents of files
<http://gnu.org/software/emacs/manual/html_node/emacs/Grep-Searching.html>,
<http://gnu.org/software/emacs/manual/html_node/emacs/Dired-and-Find.html>,
<http://www.gnu.org/software/emacs/windows/Text-and-Utility-modes.html>.

### (kill-find)

Stop find-grep-dired
<http://lists.gnu.org/archive/html/emacs-devel/2006-08/msg00602.html>

    C-c C-k

## (dired-do-shell-command)

Runs tar on the entire list of file names, putting them into one tar
file foo.tar:

    ! tar cf foo.tar * <RET>

## (shell-command-on-region)

    M-| cmd RET

## 41.9 Term Mode

<http://gnu.org/software/emacs/manual/html_node/emacs/Term-Mode.html>

    M-x term

    C-c C-j
        Switch to line mode.

    C-c C-k
        Switch to char mode.

The following commands are only available in char mode:

    C-c C-c
        Send a literal <C-c> to the sub-shell.


## Text

    M-x text-mode
        Mode for editing text files.
    M-s
        Center line.
    M-S
        Center paragraph.
    M-x
        Center-region name says.

## Macro-command

<http://emacs-fu.blogspot.ru/2010/07/keyboard-macros.html>

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

## C, C++, PHP and Java Modes

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

## 30.5.1 Comment Commands

<http://gnu.org/software/libtool/manual/emacs/Comment-Commands.html>

    M-;
Insert or realign comment on current line; alternatively, comment or
uncomment the region (comment-dwim).

    C-u M-;
Kill comment on current line (comment-kill).

### Other

    C-c C-c (comment-region)
This command comments out the lines that start in the region. With
a negative argument, it does the opposite - it deletes the comment
delimiters from these lines. See Multi-Line Comments, for fuller
details. comment-region isn't actually part of CC Mode - it is
given a CC Mode binding for convenience.

    M-x uncomment-region


## ediff

### (ediff-regions-wordwise)

#### (ediff-regions-wordwise)

##### (exit-recursive-edit)

<https://www.gnu.org/software/emacs/manual/html_node/emacs/Recursive-Edit.html>
    C-M-c

## More general

    M-x outline-minor-mode
        Collapses function definitions in a file to a mere {...}.
    M-x show-subtree
        If you are in one of the collapsed functions, this un-collapses it.

## GDB (debugger)

    M-x gdb
        Starts up gdm in an extra window.

## Filling Text

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

## Version Control (vc.el)

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

## PCL-CVS

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

## Subversion

<http://emacswiki.org/SvnStatusMode>,
<http://svn.apache.org/repos/asf/subversion/trunk/contrib/client-side/emacs/psvn.el>

## Tags

### (visit-tags-table)

Specify path to tag index file and load tag index file

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

## [Spelling][]

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

## Local Variables in Files

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

## Interactively Do Things

### History

Recently visited files and directories

Change to previous/next directories from the history:

    M-p
    M-n

Search for a file matching your input:

    M-s

### (ido-edit-input function)

    C-e

## Customization Interface

[See](http://gnu.org/software/emacs/manual/html_node/emacs/Easy-Customization.html)

### (customize)

Browse settings and change them.

### (customize-group)

Creates a customization buffer that shows the top-level Emacs group
and the second-level groups immediately under it.

## Haskell

### Load the code into the GHC intepreter

<http://learnhaskell.blogspot.com/2007/09/lesson-1-hello-world.html>

    C-c C-l

## Ibuffer

### Search all marked buffers

<http://emacswiki.org/IbufferMode#toc1>.

* `M-s a C-s`   do incremental search in the marked buffers
* `M-s a C-M-s` isearch for regexp in the marked buffers
* `U`           replace by regexp in each of the marked buffers
* `Q`           query replace in each of the marked buffers
* `I`           as above, with a regular expression

## Undo tree

<http://www.dr-qubit.org/undo-tree/undo-tree.el>

* `C-_` `C-/` (`undo-tree-undo`) Undo changes
* `M-_` `C-?` (`undo-tree-redo`) Redo changes

## Compilation

### Recompile directory

#### (byte-recompile-directory)

<http://stackoverflow.com/questions/1217180/how-do-i-byte-compile-everything-in-my-emacs-d-directory#1217249>.

Will compile all the .el files in the directory and in all
subdirectories below.

The `C-u 0` part is to make it not ask about every `.el` file that
does not have a `.elc` counterpart.

    C-u 0 M-x byte-recompile-directory

#### Batch

<http://stackoverflow.com/questions/1217180/how-do-i-byte-compile-everything-in-my-emacs-d-directory#12394284>

    emacs --batch --eval '(byte-recompile-directory "~/.emacs.d")'

## .dir-locals.el

Per-Directory Local Variables

<http://www.gnu.org/software/emacs/manual/html_node/emacs/Directory-Variables.html>

## Color themes

### (list-faces-display)

List of all faces.

### (color-theme-print)

Faces currently used.

### (color-theme-compare)

Differences between theme A and theme B.

## SQL

<http://emacsredux.com/blog/2013/06/13/using-emacs-as-a-database-client>

### Execute query from buffer

#### Set database type

Set `postgres` or `mysql` in buffer with sql query:

    sql-set-product

#### Set connected buffer

Set `SQL` in buffer with sql query:

    sql-set-sqli-buffer

#### Execute query

    sql-send-region

[load-file]: http://gnu.org/software/emacs/manual/html_node/emacs/Lisp-Libraries.html#index-load_002dfile-2360

## (normal-mode)

Choose the major mode for this buffer automatically

## (toggle-read-only)

    C-x C-q

## (projectile-invalidate-cache)
