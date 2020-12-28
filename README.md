# Tasks

## Instructions/Environment Setup
1. fork this repo to your own public github repo and clone to your local machine
2. install salesforce SFDX CLI development tools (i recommend using VS code because salesforce maintains the "Salesforce Extension Pack" which makes working with the SFDX tools a lot easier, but you are welcome to use a different IDE/terminal if you prefer)
3. create a scratch org and push the source from this project into it
4. complete the listed tasks
5. ensure your changes have been pulled back into your local environment
6. push your updated project to the public repo you created and share the link with me
- there is a lot of documentation about 1st and 2nd generation "package management" within the SFDX docs, which we would likely make use of if we were planning to implement our work back into a live salesforce environment, but don't worry about any of that here, we don't need to create a package for this, the project source files as they appear in the repo are fine.
## Lead/Contact Formatting
1. capitalize first and last name: john doe => John Doe
2. remove any unnecessary phone formatting: (123) 456-7890 => 1234567890
3. create a task assigned to the record owner to investigate if a lead/contact record is missing state or country info
## Object Relationships
 1. custom object to keep track of how many houses a contact has 
 2. custom object to keep track of how many windows each house has
 - need fields to track window dimensions for width(in), height(in), and also calculated sqft
 3. we need a custom object to keep track of how many/what type of Indow inserts each window has 
 - need picklist for standard/acoustic product type
 - also direct relationship to contact
## Reporting
1. What percentage of inserts sold overall are Acoustic type?
 - report showing all Indow inserts grouped by product type (standard/acoustic) with calculated product type percentage breakdown
2. Do our customers tend to have more Standard or Acoustic type inserts?
 - report showing all Indow inserts grouped by contact with calculated percentage breakdown of product type per contact 
3. In which states are Acoustic inserts more popular than Standard inserts?
 - report showing all Indow inserts grouped by contact's State (US only) ordered by highest percentage of acoustic product type


## Read All About It

- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)
