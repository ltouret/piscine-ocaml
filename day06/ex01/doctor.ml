class doctor (name : string) (age_init : int) (sidekick : People.people) =
  object (self)
    val mutable hp : int = 100
    val mutable age : int = age_init

    initializer
      print_endline
        ("Materialization complete. The Doctor is here, current incarnation: "
       ^ name ^ ". Age: " ^ string_of_int age ^ ". Bio-signs: "
       ^ string_of_int hp ^ " HP. " ^ "Traveling with sidekick: "
       ^ sidekick#to_string)

    method to_string =
      "My name is " ^ name ^ ", I’m the Doctor! I have " ^ string_of_int hp
      ^ " HP." ^ " I'm " ^ string_of_int age
      ^ " years old, and I got my sidekick: " ^ sidekick#to_string

    method talk = print_endline "Hi! I’m the Doctor!"

    method travel_in_time start arrival =
      print_endline "       _  _";
      print_endline "      | || |";
      print_endline "  ____| || |____";
      print_endline " |  POLICE BOX  |";
      print_endline " |______________|";
      print_endline "  |  []    []  |";
      print_endline "  |  []    []  |";
      print_endline "  |____________|";
      print_endline "Vwoorp! Vwoorp! Vwoorp!";

      let delta = arrival - start in
      age <- age + delta;
      print_endline
        ("The TARDIS landed. Current age is now: " ^ string_of_int age)

    method use_sonic_screwdriver =
      print_endline "Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii Whiiiiwhiiiwhiii"

    method private regenerate = hp <- 100
  end
