#!/usr/bin/env ocaml

#use "../utils.ml"

let () = 

  let move_dial old_pos moves = 
    let new_pos = old_pos + moves in
    let crossed_zero = (abs new_pos) / 100 in
    new_pos |> pos_mod 100, 
    crossed_zero + (if new_pos = 0 || (old_pos > 0 && new_pos < 0) then 1 else 0)
  in

  let parse s = 
    let l = String.length s in
    match l with 
    | 0 | 1 -> Printf.printf "Line too short: %s" s; 0
    | _ -> match String.sub s 1 (l - 1) |> int_of_string_opt with 
           | None -> Printf.printf "Parsing of number part failed: %s" s; 0 
           | Some n -> match s.[0] with 
                       | 'R' -> n 
                       | 'L' -> -1 * n 
                       | _ -> Printf.printf "Parsing of direction part failed: %s" s; 0
  in
  let count_zero_hits acc inp =
    let clicks, zeroes = acc in
    let moves = (parse inp) in
    let new_clicks = (clicks + moves) |>  pos_mod 100 in
    let new_zeroes = zeroes + (if new_clicks = 0 then 1 else 0) in
    new_clicks, new_zeroes
  in

  let count_all_zero_hits acc inp =
    let dial_pos, zeroes = acc in
    let moves = (parse inp) in
    let new_dial_pos, circlings = move_dial dial_pos moves in
    let new_zeroes = zeroes + circlings in
    new_dial_pos, new_zeroes
  in

  let lines = In_channel.with_open_bin "./real_input.txt" In_channel.input_lines in 
  let _, password = List.fold_left count_zero_hits (50,0) lines in
  let _, corr_password = List.fold_left count_all_zero_hits (50,0) lines in
  Printf.printf "Password: %d\n" password;
  Printf.printf "Actually the password: %d\n" corr_password

