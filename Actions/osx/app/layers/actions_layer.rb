class ActionsLayer < Joybox::Core::Layer

  def on_enter
    layout_characters
    layout_menu
  end

  def layout_characters
    @first_character = Sprite.new file_name: 'sprites/character_horn_girl.png', position: [773, 375]
    self << @first_character

    @second_character = Sprite.new file_name: 'sprites/character_pink_girl.png', position: [870, 630]
    self << @second_character

    @third_character = Sprite.new file_name: 'sprites/character_boy.png', position: [975, 200]
    self << @third_character
  end

  def layout_menu
    MenuLabel.default_font_size = 60
    MenuLabel.default_font_name = 'American Typewriter'

    menu_items = Array.new

    bezier_label = MenuLabel.new text: 'Bezier', color: '#172042'.to_color, do |menu_item|
      apply_bezier_action
    end
    menu_items << bezier_label

    blink_label = MenuLabel.new  text: 'Blink', color: '#172042'.to_color, do |menu_item|
      apply_blink_action
    end
    menu_items << blink_label

    fade_label = MenuLabel.new text: 'Fade', color: '#172042'.to_color, do |menu_item|
      apply_fade_action
    end
    menu_items << fade_label

    jump_label = MenuLabel.new text: 'Jump', color: '#172042'.to_color, do |menu_item|
      apply_jump_action
    end
    menu_items << jump_label

    move_label = MenuLabel.new text: 'Move', color: '#172042'.to_color, do |menu_item|
      apply_move_action                           
    end
    menu_items << move_label

    rotate_label = MenuLabel.new text: 'Rotate', color: '#172042'.to_color, do |menu_item|
      apply_rotate_action                         
    end
    menu_items << rotate_label

    scale_label = MenuLabel.new text: 'Scale', color: '#172042'.to_color, do |menu_item|
      apply_scale_action                      
    end
    menu_items << scale_label

    skew_label = MenuLabel.new text: 'Skew', color: '#172042'.to_color, do |menu_item|
      apply_skew_action
    end
    menu_items << skew_label

    tint_label = MenuLabel.new text: 'Tint', color: '#172042'.to_color, do |menu_item|
      apply_tint_action                 
    end
    menu_items << tint_label

    menu = Menu.new items: menu_items, position: [150, Screen.half_height]

    menu.align_items_vertically
    self.add_child(menu, z: 1)
  end

  def apply_bezier_action
    first_bezier = Bezier.by bezier: [[10, 10], [10, 10], [10, 10]]
    first_bezier_reverse = first_bezier.reverse
    first_bezier_sequence = Sequence.with actions: [first_bezier, first_bezier_reverse]

    @first_character.run_action(Repeat.forever action:first_bezier_sequence)

    second_bezier = Bezier.by bezier: [[-10, -10], [-10, -10], [-10, -10]]
    second_bezier_reverse = second_bezier.reverse
    second_bezier_sequence = Sequence.with actions: [second_bezier, second_bezier_reverse]

    @second_character.run_action(Repeat.forever action:second_bezier_sequence)

    third_bezier = Bezier.by bezier: [[-10, 10], [-10, 10], [-10, 10]]
    third_bezier_reverse = third_bezier.reverse
    third_bezier_sequence = Sequence.with actions: [third_bezier, third_bezier_reverse]

    @third_character.run_action(Repeat.forever action:third_bezier_sequence)
  end

  def apply_blink_action
    first_blink = Blink.with times:5
    @first_character.run_action(Repeat.forever action:first_blink)

    second_blink = Blink.with times:10
    @second_character.run_action(Repeat.forever action:second_blink)

    third_blink = Blink.with times:2
    @third_character.run_action(Repeat.forever action:third_blink)
  end

  # Important: Fade.to does not respond to 'reverse' method
  def apply_fade_action
    first_fade = Fade.in
    first_fade_reverse = first_fade.reverse
    first_fade_sequence = Sequence.with actions: [first_fade, first_fade_reverse]

    @first_character.run_action(Repeat.forever action:first_fade_sequence)

    second_fade = Fade.out
    second_fade_reverse = second_fade.reverse
    second_fade_sequence = Sequence.with actions: [second_fade, second_fade_reverse]

    @second_character.run_action(Repeat.forever action:second_fade_sequence)

    third_fade = Fade.to opacity: 127
    third_fade_reverse = Fade.to duration:0.3, opacity: 255
    third_fade_sequence = Sequence.with actions: [third_fade, third_fade_reverse]

    @third_character.run_action(Repeat.forever action:third_fade_sequence)
  end

  def apply_jump_action
    first_jump = Jump.by position: [30, 30], height: 20
    first_jump_reverse = first_jump.reverse
    first_jump_sequence = Sequence.with actions: [first_jump, first_jump_reverse]

    @first_character.run_action(Repeat.forever action:first_jump_sequence)

    second_jump = Jump.by position: [100, -100], height: 50
    second_jump_reverse = second_jump.reverse
    second_jump_sequence = Sequence.with actions: [second_jump, second_jump_reverse]

    @second_character.run_action(Repeat.forever action:second_jump_sequence)

    third_jump = Jump.by position: [-30, -30], height: 10, jumps:2
    third_jump_reverse = third_jump.reverse
    third_jump_sequence = Sequence.with actions: [third_jump, third_jump_reverse]

    @third_character.run_action(Repeat.forever action:third_jump_sequence)
  end

  def apply_move_action
    first_move = Move.by position: [30, 30]
    first_move_reverse = first_move.reverse
    first_move_sequence = Sequence.with actions: [first_move, first_move_reverse]

    @first_character.run_action(Repeat.forever action:first_move_sequence)

    second_move = Move.by position: [100, -100]
    second_move_reverse = second_move.reverse
    second_move_sequence = Sequence.with actions: [second_move, second_move_reverse]

    @second_character.run_action(Repeat.forever action:second_move_sequence)


    third_move = Move.by position: [-30, -30]
    third_move_reverse = third_move.reverse
    third_move_sequence = Sequence.with actions: [third_move, third_move_reverse]

    @third_character.run_action(Repeat.forever action:third_move_sequence)   
  end


  def apply_rotate_action
    first_rotate = Rotate.by angle: 180
    first_rotate_reverse = first_rotate.reverse
    first_rotate_sequence = Sequence.with actions: [first_rotate, first_rotate_reverse]

    @first_character.run_action(Repeat.forever action:first_rotate_sequence)

    second_rotate = Rotate.by angle: 360
    second_rotate_reverse = second_rotate.reverse
    second_rotate_sequence = Sequence.with actions: [second_rotate, second_rotate_reverse]

    @second_character.run_action(Repeat.forever action:second_rotate_sequence)


    third_rotate = Rotate.by angle: -90
    third_rotate_reverse = third_rotate.reverse
    third_rotate_sequence = Sequence.with actions: [third_rotate, third_rotate_reverse]

    @third_character.run_action(Repeat.forever action:third_rotate_sequence)   
  end


  def apply_scale_action
    first_scale = Scale.by scale: 1.5
    first_scale_reverse = first_scale.reverse
    first_scale_sequence = Sequence.with actions: [first_scale, first_scale_reverse]

    @first_character.run_action(Repeat.forever action:first_scale_sequence)

    second_scale = Scale.by scale: 0.5
    second_scale_reverse = second_scale.reverse
    second_scale_sequence = Sequence.with actions: [second_scale, second_scale_reverse]

    @second_character.run_action(Repeat.forever action:second_scale_sequence)


    third_scale = Scale.by scale: -2
    third_scale_reverse = third_scale.reverse
    third_scale_sequence = Sequence.with actions: [third_scale, third_scale_reverse]

    @third_character.run_action(Repeat.forever action:third_scale_sequence) 
  end


  def apply_skew_action
    first_skew = Skew.by x: 5, y: 5
    first_skew_reverse = first_skew.reverse
    first_skew_sequence = Sequence.with actions: [first_skew, first_skew_reverse]

    @first_character.run_action(Repeat.forever action:first_skew_sequence)

    second_skew = Skew.by x: -5, y:10
    second_skew_reverse = second_skew.reverse
    second_skew_sequence = Sequence.with actions: [second_skew, second_skew_reverse]

    @second_character.run_action(Repeat.forever action:second_skew_sequence)


    third_skew = Skew.by x: -10, y: -10
    third_skew_reverse = third_skew.reverse
    third_skew_sequence = Sequence.with actions: [third_skew, third_skew_reverse]

    @third_character.run_action(Repeat.forever action:third_skew_sequence)     
  end

  # Important: Tint does not respond to 'reverse' method
  def apply_tint_action
    first_tint = Tint.by color: '#5269d6'.to_color
    @first_character.run_action(first_tint)

    second_tint = Tint.by color: '#e92672'.to_color
    @second_character.run_action(second_tint)

    third_tint = Tint.to color: '#f7c752'.to_color
    @third_character.run_action(third_tint)   
  end
    
end