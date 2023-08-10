# RoR-recipe-app

## Getting Started

The Recipe app keeps track of all your recipes, ingredients, and inventory. It will allow you to save ingredients, keep track of what you have, create new recipes, and generate a shopping list based on what you have and what you are missing from a recipe. Also, since sharing recipes is an important part of cooking the app allows you to make them public so anyone can access them.

<a name="readme-top"></a>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
- [💻 Getting Started](#getting-started)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Setup](#setup)
  - [Usage](#usage)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [❓ FAQ](#faq)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 RoR-recipe-app <a name="about-project"></a>

For simpler understanding the **RoR-recipe-app** follows the following Entity Relationship Diagram.

![Entity Relationship Diagram](/app/assets/images/erdiagram.png)

## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
<summary>Server</summary>
  <ul>
    <li>Locally using <a href="https://learn.microsoft.com/en-us/windows/wsl/about">WSL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

> Key features of the repository.

- **Was created with RoR** 
- **Has a database that follows the diagram above**
- **Has a login and registration authentication system with the help of devise**
- **Has Rubocop to enforce best ruby practices**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- GETTING STARTED -->

## 💻 Getting Started <a name="getting-started"></a>

Follow these steps in order to run ruby code.

### Prerequisites

First you need to ensure that you have ruby installed in your computer. 

### Install

It varies depending on your operating system so here are some links to help you install it on [Windows](https://gorails.com/setup/windows/10) and on [Ubuntu](https://www.ruby-lang.org/en/documentation/installation/#apt). 

For MacOS run the following commands

```sh
  brew install rbenv ruby-build
  # Add rbenv to bash so that it loads every time you open a terminal
  echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile
  source ~/.bash_profile

  # Install Ruby
  rbenv install 3.0.1
  rbenv global 3.0.1
  ruby -v
```

This example shows how to install Ruby 3.0.1 which was the latest version in April 2021, but you can check to see if there is a newer version [here](https://www.ruby-lang.org/en/downloads/releases/). Iy is also assumed that you have [homebrew](https://brew.sh/) already installed on your Mac.

Next you'll want to intall Rails and postgreSQL by running the following commands, but you can also use any SQL application of your choice

```shell
  gem install rails -v 7.0.6

  sudo apt install postgresql libpq-dev
```

And start postgreSQL and the app with 

```shell
  sudo service postgresql start

  rails server
```

### Setup

Once you have ruby installed, run this command to get the project on your local machine.

```sh
  git clone git@github.com:jlvFlores/RoR-recipe-app.git
```

### Usage

Once you have the project installed, access the project's root directory usign this command 

```sh
  cd RoR-recipe-app
```

And lastly, run this command to see the project in in your browser.

```sh
  rails server
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

> Here is a mention all of the collaborators of this project.

👤 **Author 1**

- GitHub: [@jlvFlores](https://github.com/jlvFlores)
- Twitter: [@JoseVaz44312762](https://twitter.com/JoseVaz44312762)
- LinkedIn: [Jose (Luis) Vazquez](https://www.linkedin.com/in/jose-luis-vazquez/)

👤 **Author 2**

- GitHub: [@federicaulzurrun](https://github.com/federicaulzurrun)
- LinkedIn: [Federica Ulzurrun](https://www.linkedin.com/in/federica-ulzurrun-293a86198/)

👤 **Author 3**

- GitHub: [@kkolade](https://github.com/kkolade)
- Twitter: [@kola_kolade](https://twitter.com/kola_kolade)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

> The following are the future features that will be added to the project.

- [ ] **Further accessibility**
- [ ] **New color template**
- [ ] **Add pagination**
- [ ] **It will probably not take over the world**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](../../issues/).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project you can give me a hand by recommending me to potential employers! 😉🤝

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thank those who have motivated me to keep on fighting despite how tough the journey may become.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>

This project is [MIT](./LICENSE) licensed.

<p align="right">(<a href="#readme-top">back to top</a>)</p>
