# snowfall - Sam Roussel

# the main chord progression
chords = (ring chord(:C4, :add9), chord(:E4, :m7), chord(:F4, :major7), invert_chord(chord(:E4, :m7), 1))

# chord washes
define :washes do
  use_synth :dark_ambience
  4.times do
    play chords.tick(), attack: 12, release: 12, amp: 4
    sleep 18
  end
end

# plays the chords in beats/4 time
define :chord_progression do |beats|
  use_synth :dark_ambience
  4.times do
    play chords.tick(), attack: 0.5, release: 5, amp: 5
    sleep beats
  end
end

# the first melody
define :first_melody do
  use_synth :hollow
  play :C4
  sleep 1
  play :G4
  sleep 2
  play :B3
  sleep 1
  play :G4
  sleep 2
  play :A3
  sleep 1
  play :G4
  sleep 2
  play :B3
  sleep 3
end

define :second_melody do
  use_synth :hollow
  play :C4
  sleep 1
  play :G4
  sleep 1
  play :E4
  sleep 2
  play :B3
  sleep 1
  play :G4
  sleep 1
  play :D4
  sleep 2
  play :C4
  sleep 1
  play :G4
  sleep 1
  play :E4
  sleep 1
  play :D4
  sleep 5
end

define :third_melody do
  use_synth :hollow
  play :A4
  sleep 1
  play :G4
  sleep 2
  play :F4
  sleep 1
  play :E4
  sleep 2
  play :F4
  sleep 1
  play :E4
  sleep 2
  play :D4
  sleep 3
end


# begin song
# if the washes are counted as a theme,  the form is: ABCBDBCBA

washes

2.times do
  in_thread do
    chord_progression 3
  end
  
  first_melody
end

2.times do
  in_thread do
    chord_progression 4
  end
  
  second_melody
end

2.times do
  in_thread do
    chord_progression 3
  end
  
  first_melody
end

2.times do
  in_thread do
    chord_progression 3
  end
  
  third_melody
end

2.times do
  in_thread do
    chord_progression 3
  end
  
  first_melody
end

2.times do
  in_thread do
    chord_progression 4
  end
  
  second_melody
end

2.times do
  in_thread do
    chord_progression 3
  end
  
  first_melody
end

washes
