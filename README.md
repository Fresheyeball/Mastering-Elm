![Mastering Elm](http://fresheyeball.com/logo.png)

### A paranormal investigation into frontend development

Welcome to Mastering Elm. We are going to cover a variety of topics geared at getting you up and running in Elm in production as fast as possible.

## Prerequisites

Before you begin the investigation, you will need some tools.

### The Elm Platform

First, you are going to need **Elm** installed locally. You can get the installer from [elm-lang.org](http://elm-lang.org/install), or below (mirrored from [Docs](https://guide.elm-lang.org/install.html)):

- Mac -- [installer](http://install.elm-lang.org/Elm-Platform-0.18.pkg)
- Windows -- [installer](http://install.elm-lang.org/Elm-Platform-0.18.exe)
- Anywhere -- npm installer (below), [build from source](https://github.com/elm-lang/elm-platform)

Or just use **npm**

```bash
npm install -g elm@0.18.0
```

![Elm](http://seeklogo.com/images/E/elm-logo-9DEF2A830B-seeklogo.com.png)

After doing so you will have the following new executables on your `$PATH`.

- elm-make
- elm-reactor
- elm-repl
- elm-package

as well as `elm` which is just a wrapper for the executables above. Instead of typing `elm-make` you may type `elm make` instead.

### The Editor

In this course, I am going to be using the Atom code editor. There is good Elm support on many more editors, however, Atom is the editor with tools I am personally most familiar with, so if you choose another editor, I may not be able to provide support on that editor's tools. You can learn all about the editor support for Elm [here](https://guide.elm-lang.org/install.html).

![Atom](http://github-atom-io-herokuapp-com.global.ssl.fastly.net/assets/demo-5424fd270fc16cb3a3fb5868a0e431bd.gif)

1. Download and install Atom from here: [atom.io](https://atom.io/)
1. Once Atom is installed you will want to install the following packages
    - language-elm
    - linter-elm-make
    - elmjutsu

   You may install packages in Atom either by using the GUI under the "Settings" section. Or on the command line:

   ```bash
   apm install language-elm linter-elm-make elmjutsu
   ```

   #### PLEASE DISABLE linter-elm-make until after the Syntax section. As it is overly helpful.

1. While these package are ample. You may optionally want the following packages for real world use cases:
   - elm-format
   - html-to-elm
   - elm-instant
   - elm-navigator

### Important note on exercise files

All exercises in this workshop come with complete and incomplete versions. The complete versions are there for times when you get stuck, or just want to see another way of doing things, NOT for circumventing the exercise. Please refrain from using the completed exercises unless you feel you need to. Try to do the exercise on your own first.
