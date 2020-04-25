open Rooms
open Command
open State
open Gui
open Yojson.Basic

let start_screen = ANSITerminal.(print_string [blue]"\n\nWelcome to Betrayal of CU on the Hill! \n")
let prompt = print_endline "> "

(** [parse_input ()] is [i] only if i is a well-formed command. 
    Otherwise, it will prompt the user again for input. *)
let rec parse_input () =
  match Command.parse (read_line ()) with
  | exception Command.Empty -> 
    print_endline "Where would you like to go?"; 
    print_string "> ";
    parse_input ()
  | exception _ -> 
    print_endline "I don't understand that."; 
    print_string "> ";
    parse_input ()
  | c -> c

<<<<<<< HEAD

(** [play st] resumes play from the game state in [state]. *)
let rec play state = 
  (** TODO: -print the board 
            -prompt the user, print a description of the room*)
  print_string (State.room_desc state);
  print_string "> ";
  match parse_input () with
  | Quit -> exit 0
  | Go d -> play (State.move_player d state)
=======
(** [play st] is the actual game play with the gui and state.
    GUI not yet implemented. *)
let rec play st = 
  (** TODO: print the board *)
  print_string "> ";
  match parse_input () with
  | Quit -> exit 0
  | Go d -> State.move_player d

(** [play_game f] starts the adventure in file [f]. *)
let play_game f =
  let state = State.from_json f in
  play state
>>>>>>> 40c045c93adfbf0ccbb74ff29eac9e7a1bbd07b0

(** [main ()] prompts for the game to play, then starts it. *)
let main () =
  start_screen;
  prompt;
  begin
    match read_line () with
    | exception End_of_file -> ()
<<<<<<< HEAD
    | f -> play (f |> Yojson.Basic.from_file |> State.from_json)
=======
    | f -> play_game (Yojson.Basic.from_file "test_rooms.json")
>>>>>>> 40c045c93adfbf0ccbb74ff29eac9e7a1bbd07b0
  end

(* Execute the game engine. *)
let () = main ()