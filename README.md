# Discord Web App Automation
Back-Office Web Automation project using Ruby+Cucumber+Capybara tools
## Getting Started
Install any Ruby editor/IDE:
RubyMine: https://www.jetbrains.com/ruby/download/#section=windows (free 30 day trial available)  
Aptana Studio: http://www.aptana.com/products/studio3/download.html (free)  
Komodo IDE: https://www.activestate.com/komodo-ide/downloads/ide (free 21 day trial)  
Netbeans: https://netbeans.org/downloads/ (as plugin)

Ruby download link: https://www.ruby-lang.org/en/downloads/  
Ruby Version Manager (rvm) link: https://rvm.io/rvm/install

## Prerequisites

* Clone the git repo: http://USERNAME@scm.parts-advisor.com/scm/qa/parts-advisor-bo-web-automation.git
* Install bundler: `gem install bundler`
* Run install bundler: `bundle install`

## Project structure
```
parts-advisor-bo-web-automation
|   config
|    |    test_data.yml
|    |    .........  
|   features
|    |   pages
|    |   step_definitions
|    |   support
|    |   feature files
|    report
|    |   report.json
|    |   screenshot.jpg
|    tmp
|    |   downloads
|    |   |   export.csv
|    |   |   .....
|    Gemfile
|    .gitignore
```

## Running
### Command line

To run tests:
```bash
cucumber PLATFORM=valid BROWSER=chrome|firefox --format --pretty --expand --format json -o report.json
```
#### Currently supported browsers:
* Chrome
* Mozilla Firefox
