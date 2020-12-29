# Instructions/Environment Setup
1. fork this repo to your own public github repo and clone it to your local machine
2. install the salesforce SFDX CLI development tools (i recommend using VS Code because salesforce maintains the "Salesforce Extension Pack" which makes working with the SFDX tools a lot easier, but you are welcome to use a different IDE/terminal if you prefer)
3. create a scratch org and push the source from this project into it (you will need salesforce credentials for this, as you will need to set up a dev org to authenticate with)
4. complete the listed tasks in the scratch org
    - for code tasks, the salesforce "developer console", which is accessible from the gear icon menu in the top right of the screen, can be used as an IDE to edit code and also to run test classes and view debug logs. these tasks can also be done using the VS Code "salesforce extension pack", either way you should reach the same result, it's more a matter of preference. (I tend to switch back and forth depending on what I'm working on, no hard rules here, whatever makes the most sense.)
5. ensure your changes have been pulled back from the scratch org into your local environment
6. commit and push your updated project to the public repo you created and share the link with me (Mat)
- I anticipate this will take 2-4 hours to complete
- if you get stuck or have questions, reach out to me (Mat) directly
# Tasks
## Lead/Contact Formatting
1. capitalize first and last name: john doe => John Doe
2. remove any unnecessary phone formatting: (123) 456-7890 => 1234567890
3. create a task assigned to the record owner to investigate if a lead/contact record is missing state or country info
## Object Relationships
 - we have a custom object for keeping track of how many houses a contact has
 1. add a new custom object to keep track of how many windows each house has
    - need fields to track window dimensions for width(in), height(in), and also calculated sqft
 2. we need a custom object to keep track of how many/what type of Indow inserts each window has 
    - need picklist for standard/acoustic product type
    - also direct relationship to contact
 3. add these objects to the Indow app and make them visible on the related layouts
## Reporting
1. What percentage of inserts sold overall are Acoustic type?
    - report showing all Indow inserts grouped by product type (standard/acoustic) with calculated product type percentage breakdown
2. Do our customers tend to have more Standard or Acoustic type inserts?
    - report showing all Indow inserts grouped by contact with calculated percentage breakdown of product type per contact 
3. In which states are Acoustic inserts more popular than Standard inserts?
    - report showing all Indow inserts grouped by contact's State (US only) ordered by highest percentage of acoustic product type
## Apex Trigger
### we have a contact trigger called "contact"
- when a contact is inserted, the trigger creates a corresponding new house object using the contact's address information
- whenever a contact is updated, the trigger checks to see if the address on the contact has changed. it looks at all of the houses related to the contact to find the primary house record, and updates the address on the house if it has changed on the contact
- whenever a contact is updated, the trigger counts the number of houses that are related to the contact, and stores that number in the "Number of Houses" field
### we also have a trigger on the House custom object called "house"
- whenever a house object is inserted or updated, it updates the related contact record (if there is one) in order to trigger the "Number of Houses" logic
### Errors
1. *EXCEPTION_THROWN [17]|System.AssertException: Assertion Failed: Expected: 1, Actual: 0*
    - the test method in contactHouse_test is failing on line 17, saying that there are no houses related to a contact after it is created. you can also see this by just creating a contact in salesforce. a house record is created, but it doesn't look like it is related to the contact. figure out why and correct the trigger so that the test passes.
2. *EXCEPTION_THROWN [30]|System.AssertException: Assertion Failed: Expected: 2, Actual: 1*
    - uncomment section 2 from the contactHouse_test class (lines 22 through 31)
    - the test is failing on line 31, saying that after a second house is inserted for a contact, the house trigger is not updating the related contact's "Number of Houses" field. figure out why and correct the house trigger so that the test passes. 
 
3. *EXCEPTION_THROWN [34]|System.DmlException: Delete failed. First exception on row 0 with id a003B000005AIkfQAG; first error: CANNOT_INSERT_UPDATE_ACTIVATE_ENTITY, house: execution of AfterDelete EXCEPTION_THROWN caused by: System.NullPointerException: Attempt to de-reference a null object*
    - uncomment section 3 from the contactHouse_test class (lines 34 through 42)
    - the test is failing on line 34, saying that there is dml null pointer exception when trying to update the related contact when the house is deleted. figure out why and correct the house trigger so that the test passes.  

(commit and publish your project so far to your public repo to ensure we can reference your solution up to this point because we are going to make additional changes.)
### Improvement
1. our three test sections in contactHouse_test are really testing three different things, and it would be nice to know if one of them was failing independently from the other two. restructure the test class to replace our single test method with three discrete test functions, one for each of the three sections: contactInsertTest(), houseInsert(), houseDelete()
2. find a few other ways to improve either our process, our logic, or our code




## Resources
- [Salesforce Trailblazer Community](https://trailblazers.salesforce.com)
- [Salesforce Apex Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.apexcode.meta/apexcode/apex_dev_guide.htm)
- [Salesforce Extensions Documentation](https://developer.salesforce.com/tools/vscode/)
- [Salesforce CLI Setup Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_setup.meta/sfdx_setup/sfdx_setup_intro.htm)
- [Salesforce CLI Command Reference](https://developer.salesforce.com/docs/atlas.en-us.sfdx_cli_reference.meta/sfdx_cli_reference/cli_reference.htm)
- [Salesforce DX Developer Guide](https://developer.salesforce.com/docs/atlas.en-us.sfdx_dev.meta/sfdx_dev/sfdx_dev_intro.htm)
    - note: there is a lot of documentation about 1st and 2nd generation "package management" within the SFDX docs, which we would likely make use of if we were planning to implement our work back into a live salesforce environment, but don't worry about any of that here, we don't need to create a package for this, the unpackaged project source files as they appear in the repo are fine.
