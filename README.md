# Directory Structure

`_build`
  - Created by `mix` cli.
  - We use Mix to compile our code, create databases, run our server, and more.
  - This directory must not be checked into version control and it can be removed at any time. 
  - Removing it will force Mix to rebuild your application from scratch.

`assets`
  - A directory that keeps everything related to source front-end assets, such as JavaScript and CSS, and automatically managed by the esbuild tool.

`config`
  - A directory that holds project configuration.
  - The `config/config.exs` is the entry point of your configuration.
  - At the end of the `config/config.exs`, it imports environment specific configuration, which can be found in `config/dev.exs, config/test.exs, and config/prod.exs`. 
  - Finally, `config/runtime.exs` is executed and it is the best place to read secrets and other dynamic configuration.

`deps`
  - A directory with all of our Mix dependencies. 
  - You can find all dependencies listed in the mix.exs file, inside the defp deps do function definition. 
  - This directory must not be checked into version control and it can be removed at any time. 
  - Removing it will force Mix to download all deps from scratch.

`lib`
  - A directory that holds your application source code. 
  - This directory is broken into two subdirectories, `lib/{appname}` and `lib/{appname}_web`. 
  - The `lib/{appname}` directory will be responsible to host all of your business logic and business domain. 
  - It typically interacts directly with the database - it is the "Model" in Model-View-Controller (MVC) architecture. 
  - `lib/{appname}_web` is responsible for exposing your business domain to the world, in this case, through a web application. 
  - It holds both the View and Controller from MVC.
  -  We will discuss the contents of these directories with more detail in the next sections.

`priv`
  - A directory that keeps all resources that are necessary in production but are not directly part of your source code. 
  - You typically keep database scripts, translation files, and more in here. 
  - Static and generated assets, sourced from the assets directory, are also served from here by default.

`test`
  - A directory with all of our application tests. 
  - It often mirrors the same structure found in `lib` directory.

`lib/{appname}`
  - This directory hosts all of your business domain.
  - The `lib/{appname}/application.ex` file defines an Elixir application named `{appname}.Application`.

`lib/{appname}_web`
  - This directory holds the web-related parts of our application.