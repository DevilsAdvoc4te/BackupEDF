IMPLIES NO WARRANTY
(c) 2016 N-able Technologies Inc.


*************************
* Overview              *
*************************
- The application provided assumes that you have java installed on your system.
- This software is provided as is.
- There are 3 parts to this package; a script that gathers the data, an XML service file 
  that tells N-central what to do with the data, and the EDF application.
  The XML service file must be loaded into N-central and describes the service 
  which appears in the N-central UI.  The EDF application sends the data to N-central.  
  The script file is used to call the application with any parameters required.


******************************
* Section 1: Get It Running! *
******************************
This section describes how to get one of the sample EDFs to run.

- Import the XML service file into the N-central UI, under Administration -> Service Management -> Custom Services:
	- GenericApplication.xml

- Add a device to the UI.
- Click on the Settings -> Monitoring Options tab of the device, and turn on the 'EDF Enabled' option
- Click Save
- Navigate to the Settings -> EDF tab
- For the following files, edit the "endpointURL" value to be the same as what's shown in the "IP Address of Server" field on the EDF tab of the device
	File locations: resources
	Files:
	- EDFGenericApp_en_CA.properties
	- EDFGenericApp_en_US.properties

- Edit the EDFTest.sh file and set the ACTIVATIONCODE value to be "Activation Key"
  on the EDF tab of the device in the UI.
- Make any changes to the scan detail determination as you wish.  Make sure that 
   the scan detail names are the same as in the XML service file.

- Run EDFTest.sh
  - sh ./EDFTest.sh
  - Go to the Monitoring -> Status tab of the device - you should see the service!
  - Enjoy the awesomeness that is your new monitoring service


*****************************************
* Section 2: Create Your Own Custom EDF *
*****************************************
This section describes how to create your very own EDF service.

- Make a copy of the XML service file.
- Rename the XML service file to be that of your service
- Modify the XML service file as per the instructions in the file.  You can
   delete the comments after the section you are working on is complete.
- Make a copy of the .sh file.
- Rename the .sh file to be that of your service.
- Modify the .sh file as per the instructions in the file.  Make sure that the 
   scan detail names in the file match those in the XML service file.
- Go!


