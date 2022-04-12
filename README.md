# InkScript

This folder contains all the _source_ material for producing compiled game narrative. 

Everything that happens in the game is defined in these folders. This includes:

* Game logic and state
* Narration, dialogue
* Player choices
* Player-controlled characters
* Scene direction

## How it works

All of this is written in [InkScript](https://inklestudios.com/ink). You can find instructions about how the syntax works and so on their website.

### Getting set up

In order to write InkScript, and also test it, you need a few things.

* Microsoft Visual Studio Code (latest, [download](https://code.visualstudio.com))
* Inky (latest, [download](https://github.com/inkle/inky/releases/latest))

All editing of InkScript is done inside VS Code. This is because it has a few plugins and markup extensions that are needed to write successfully. It is important: spelling and punctuation is as critical as anything as what appears in InkScript is presented to the player.

To open in VS Code:

1. Start VS Code and choose `File->Open Folder`.
2. Choose the `InkScript` folder inside where `ChangeableWorlds-Assets` is checked out on your computer.
3. It will suggest extensions to be installed. Do that.
4. Er...
5. That's it.

To test the InkScript:

1. Start Inky.
2. Go to `File->Open` and navigate to the `ChangeableWorlds.ink` file inside the `InkScript` folder.
3. To jump to a specific part of the story, modify the `ChangeableWorlds.ink` top-level direct to where it should go and set any variables (after the includes).

### Committing to GitHub

As everything is in GitHub, you must push your changes to InkScript like anything else. Small quirk is that VS Code does not recognise the `InkScript` folder is child to an actual git repository, so you can't use its built-in Git stuff.

If you do change something, make sure to PR it as appropriate.

## Organisation

Key parts of the story (normally playable characters) are called out as specific folders, e.g. `Kaidan`, `Rosan`, etc.

There is also a `Global` folder that has global constants and some variables in it that the game _engine_ can pick up on.

### A word about globals

Any global variable is read/write in InkScript _and also_ in the game engine at _runtime_. The game engine will be informed when globals change and will update its own state if necessary.

These globals are also _saved_ when the Ink story state is saved to save game file. Therefore, it is important that globals are properly managed. Most of the time, in the story flow, make sure to use `temp` variables and not `VAR` globals, unless that state should be persistent.

Other globals are defined that are _directly_ controlled by the game engine, such as time and weather states. These have simulation aspects and require code to actually operate that would be too complicated to implement in InkScript. 

If these are to be tested in Inky, set the variables to what you want first as there will be no simulation in Inky. Otherwise, you can opt to use the _console_ version of the game, that can be compiled directly in the `Engine` code.

-----

Any questions? Shoot them at @cleardemon.
