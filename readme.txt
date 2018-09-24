Folders:
  - Models: Here we can find all models related to the test.
    - Wrapper: The first model to be executed is Wrapper, which takes the url file from command line and starts the flow with the rest of classes provided.
    - Reader: Converts file content into a hash formatting all chances by name and chances.
    - Bowling: Receives the player chances and take them to frames and pass them to Game model.
    - Game: Its a frame of two chances ["10"], ["4", "6"], ["10", "4", "5"]
    - Printer: Prints all games with a respective format.

  - Resources: Differente kinds of games for bowling.

  - spec: All rspec tests files.

Execute from command line:
  - Go to the main folder in the console, bowling_scorer folder.
  - Execute in the console: ruby models/wrapper.rb <your_txt_file.txt>

Run tests:
  - Go to the main folder in the console, bowling_scorer folder
  - To test Bowling > rspec spec/models/bowling_spec.rb
  - To test Game > rspec spec/models/game_spec.rb
  - To test Printer > rspec spec/models/printer_spec.rb
  - To test Reader > rspec spec/models/reader_spec.rb
  - To test Wrapper > rspec spec/models/wrapper_spec.rb
