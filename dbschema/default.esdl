module default {
  type User {
    required single link profile -> Profile;
  }

  type Profile {
    required link user := assert_exists((SELECT .<profile[IS User]))
  }

}
