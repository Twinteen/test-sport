

	First of all I would like to thank you for this test task, which was an amazing experience for me.

	---------------------------------------------------------------------------------------------------
	In order to start the project you would need to run several commands
	1)	composer install
	2) 	npm install
	3) 	php artisan key:generate
	Don't forget to remove ".example" from ".env.example" and configure database connection.
	In folder "additional-sources" you will find EDR of the schema, Dumps of Database Structure, Data and both
	I did not created any migrations nore seeds because I was running out of time and decided not to focus on such very common things.

	---------------------------------------------------------------------------------------------------	
	
	Task workflow 
		1)	Task 1 - Modelling:
			- File is present in "additional-sources".
			- Added 2 tables "events_description" and "team_description" those are not used, however can be extanded in the future.
			- UniqueIndex - "_teams_spord_id_name" was created so that 2 or more teams with the same name would not participate in one sport.
			

		2) 	Task 2 – DB Structure/Data:
			- Basically Forward Engineer of the file "EER_test_sports.mwb".
			- ForeignKeys named due to '_' prefix convention.
			
			
		3)  	Task 3 – HTML/PHP:
			- Backend (PHP) on Laravel.
			- EventRepository is the storage of all queries based on DQL.
			- Because of very simple functionality and little entity I decided to avoid any strict verifications of data from request.
			- However I decided to make some logic verification like:
				- "A Team cannot play against itself".
				- "Check if teams that were provided by Request are exist and refer to the same and to their own sport".
			- Created Additional Route, Controller, Query for filtering events by sport. Ran out of time to implement it on the Frontend side
			
			- Frontend (HTML/JS) on Vue.
			- The logic of adding the event is based on connected dropdowns in order to select Sport - first, Team1 - second, Team2 - third
			  Each select reduces options so that basketball team would not appear on the football field or opposite.

		Used basic dev-server "php artisan serve"		