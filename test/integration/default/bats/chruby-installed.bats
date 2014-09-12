@test "chruby function is available" {
  /bin/bash --login -c "chruby"
}

@test "chruby version" {
  run /bin/bash --login -c "chruby --version"
  [ "$output" = "chruby version 0.3.4" ]
}
