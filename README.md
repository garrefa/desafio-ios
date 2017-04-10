# Github JavaPop
This app navigates through all public repositories on Github where the main programming language is Java.

## Developer notes

This repository doesn't squash commits, so that anyone can follow the complete development process, commit by commit.

The scenes were composed using a customized version of the Clean Swift templates. You can find the original ones at http://clean-swift.com/.

The RepositoryService defines several enums and structs that makes the API very extensible if we want to, in the future, support more programming languages, change sort parameters and filters, etc.

The app is already localized for en_US and pt-BR.

## Running the project

This project was built using Xcode 8.2.

The minimum iOS version is 9.0 (despite the constraint to iOS 8.0 in the task description). This was necessary to enable some APIs for UI tests.

Pods are tracked in the repository and Pod's versions are fixed, so every commit carries all the dependencies and you shouldn't need to run `pod install` before.

Before you build the project you may notice a missing file called `R.generated.swift`; This file will be generated in a build phase.

## Maintainers
* Cicero Camargo - camargo _dot_ cicero _at_ gmail _dot_ com