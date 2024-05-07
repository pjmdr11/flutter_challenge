# Flutter Challenge

Flutter project sample with *country* and *states* dropdown for location selection.
This project demonstrates usage of 
- Flutter Clean Architecture.
-  Statemanagement using *[Flutter Bloc](https://pub.dev/packages/flutter_bloc)*
- Dependency Injection using *[GetIt](https://pub.dev/packages/get_it)* and *[Injectables](https://pub.dev/packages/injectable)*
-	Network calls using *[Dio](https://pub.dev/packages/dio)*
- *[Freezed](https://pub.dev/packages/freezed)* for code generation.

# Getting Started
1. Setup Flutter
2. Clone the repo
			

	    $git clone git@github.com:pjmdr11/flutter_challenge.git
	    $cd flutter_challenge
	    $flutter pub get
		
3. Create two files namely **.env** and **.env.dev** in the root of the project folder and populate the env file according to the **.env.example**
	*Sample*
	

        API_BASE_URL="server_base_url"
    	API_KEY="api_key"

4. Run the project.
	
	`flutter run`
