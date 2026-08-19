//core library that provides API
import 'dart:io'; 


//variable for the version
const version = '0.0.1';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Hello, Dart!');
  } else if (arguments.first == 'version') {
    print('Dartpedia CLI version $version');
  }
}


//search command running the core logic of the application

void searchWikipedia(List<String>? arguments) {
  final String articleTitle;

  // If the user didn't pass in arguments, request an article title.
  if (arguments == null || arguments.isEmpty) {
    print('Please provide an article title.');
    // Await input and provide a default empty string if the input is null.
    articleTitle = stdin.readLineSync() ?? '';
  } else {
    // Otherwise, join the arguments into a single string.
    articleTitle = arguments.join(' ');
  }

  print('Looking up articles about "$articleTitle". Please wait.');
  print('Here ya go!');
  print('(Pretend this is an article about "$articleTitle")');
}



//this function makes the output ore user-friendly, 
void printUsage() { 
  print(
    "The following commands are valid: 'help', 'version', 'search <ARTICLE-TITLE>'"
  );
}
