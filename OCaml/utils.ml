let powerr n = n * n
let powerrr n = n * n * n

let read_file_as_single_string filename =
  let ic = open_in filename in
  let contents = really_input_string ic @@ in_channel_length ic in
  close_in ic;
  contents
