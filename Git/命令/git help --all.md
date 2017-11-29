# git help --all
>key: 2017-11-29 16:33:40  
>得到一个完整（有点让人生畏）的 git 子命令列表。

```bash
$ git help --all
usage: git [--version] [--help] [-C <path>] [-c name=value]
           [--exec-path[=<path>]] [--html-path] [--man-path] [--info-path]
           [-p | --paginate | --no-pager] [--no-replace-objects] [--bare]
           [--git-dir=<path>] [--work-tree=<path>] [--namespace=<name>]
           <command> [<args>]

available git commands in '/Applications/Xcode.app/Contents/Developer/usr/libexec/git-core'

  add                       merge-ours
  add--interactive          merge-recursive
  am                        merge-resolve
  annotate                  merge-subtree
  apply                     merge-tree
  archive                   mergetool
  bisect                    mktag
  bisect--helper            mktree
  blame                     mv
  branch                    name-rev
  bundle                    notes
  cat-file                  p4
  check-attr                pack-objects
  check-ignore              pack-redundant
  check-mailmap             pack-refs
  check-ref-format          patch-id
  checkout                  prune
  checkout-index            prune-packed
  cherry                    pull
  cherry-pick               push
  citool                    quiltimport
  clean                     read-tree
  clone                     rebase
  column                    rebase--helper
  commit                    receive-pack
  commit-tree               reflog
  config                    remote
  count-objects             remote-ext
  credential                remote-fd
  credential-cache          remote-ftp
  credential-cache--daemon  remote-ftps
  credential-osxkeychain    remote-http
  credential-store          remote-https
  daemon                    remote-testsvn
  describe                  repack
  diff                      replace
  diff-files                request-pull
  diff-index                rerere
  diff-tree                 reset
  difftool                  rev-list
  difftool--helper          rev-parse
  fast-export               revert
  fast-import               rm
  fetch                     send-email
  fetch-pack                send-pack
  filter-branch             sh-i18n--envsubst
  fmt-merge-msg             shell
  for-each-ref              shortlog
  format-patch              show
  fsck                      show-branch
  fsck-objects              show-index
  gc                        show-ref
  get-tar-commit-id         stage
  grep                      stash
  gui--askpass              status
  hash-object               stripspace
  help                      submodule
  http-backend              submodule--helper
  http-fetch                subtree
  http-push                 svn
  imap-send                 symbolic-ref
  index-pack                tag
  init                      unpack-file
  init-db                   unpack-objects
  instaweb                  update-index
  interpret-trailers        update-ref
  log                       update-server-info
  ls-files                  upload-archive
  ls-remote                 upload-pack
  ls-tree                   var
  mailinfo                  verify-commit
  mailsplit                 verify-pack
  merge                     verify-tag
  merge-base                web--browse
  merge-file                whatchanged
  merge-index               worktree
  merge-octopus             write-tree
  merge-one-file

git commands available from elsewhere on your $PATH

  cvsserver

'git help -a' and 'git help -g' list available subcommands and some
concept guides. See 'git help <command>' or 'git help <concept>'
to read about a specific subcommand or concept.
```