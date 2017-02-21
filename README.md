# cozy-nix

Sets up a basic development environment on a non-headless Debian-based with all
the things that I use often.  Made so that I don't have to do all of this by
hand any time I set up a new installation.

## Running

If you're smart you'll realize that a bare Debian installation doesn't have Git
installed!  So then how does one set things up?  The normal method would be to
use curl and pipe it to sh, but we don't have curl either.  So we have to use a
little bit a wget (oh no!).

    wget -O - https://raw.githubusercontent.com/treyzania/cozy-nix/master/cozy.sh | sh
