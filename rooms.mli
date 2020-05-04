(** Room information that gets placed into a tile. Whereas tiles represent the
    physical aspect of a spot, rooms contain the qualitative info, such as
    descriptions and effects.

    This module defines the data structure for rooms. It handles loading that
    data from JSON files and querying that data.
*)

(** The abstract type of values representing rooms *)
type t

(** The type of room names *)
type room_id = string

(** The type of effect sets *)
type eff_lst = Yojson.Basic.t list

(** [from_json j] is the room that [j] represents.
    Requires: [j] is a valid JSON room representation. *)
val from_json : Yojson.Basic.t -> t

(** [room_id r] is the name of room [r]. *)
val room_id : t -> room_id

(** [room_desc r] is the description of room [r]. *)
val room_desc : t -> string

(** [room_effects r] is the effect list of room [r] *)
val room_effects : t -> eff_lst

(* ----------------------------------- *)

(** [tests] is a list of OUnit test cases for all functions in Tiles. *)
val tests : OUnit2.test list