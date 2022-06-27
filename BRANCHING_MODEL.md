# Git Branching Strategy

**Please follow the branching model as described below for any implementation that you want to do on this respository.**

## **main**
> This is the main branch or the default branch of the repository and nothing should be pushed directly on this branch. Only release branch code should be pushed to this branch once it is completely tested and is live. Code in this branch is bug free and does not have any issues. Code is merged on this branch from the release branch only by means of pull requests. Developers can not commit the code in this branch directly.

## **release**
> Release branches are used for release task and long-term maintenance of software versions. Typically, they branch from, and fixes are merged back into, the development branch. Code is usually made live from this branch as it will keep track of all the tags and releases.

## **development**
> This is generally the integration branch for feature. In a workflow using pull requests, this is usually the branch where new feature branches are targeted. In other cases, developers might commit directly to this branch.

## **feature**
> Feature branches are used for specific feature work or improvements. They generally branch from, and merge back into, the development branch, by means of pull requests. 

## **bugfix**
> Bugfix branches are typically used to fix the issues in the release branches. They generally branch from release branch and then merge back into the development branch.

## **hotfix**
> Hotfix branches are used to quickly fix the production branch without interrupting changes in the development branch. Changes are usually merged into the main branch be means of pull requests and merged back into release and developement branches.

