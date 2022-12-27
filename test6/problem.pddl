(define (problem problem_bar)

    (:domain domain_bar)
    
    (:objects
        glass_A glass_B glass_C glass_D
        table_A table_B table_C table_D
        shelf dispenser
        drink_A drink_B drink_C drink_D
    )
    
    (:init 
        (GLASS glass_A) (GLASS glass_B) (GLASS glass_C) (GLASS glass_D)
        (SPOT table_A) (SPOT table_B) (SPOT table_C) (SPOT table_D)
        (SPOT shelf) (SPOT dispenser)
        (DRINK drink_A) (DRINK drink_B) (DRINK drink_C) (DRINK drink_D)
        
        ;set the position of the robot, with no things in the hands
        (robot_at shelf) (empty_robot) 
        
        ; set the glasses on the shelf
        (glass_at glass_A shelf) (glass_at glass_B shelf)
        (glass_at glass_C shelf) (glass_at glass_D shelf)
        
        (drink_at drink_A dispenser) (drink_at drink_B dispenser)
        (drink_at drink_C dispenser) (drink_at drink_D dispenser)
        
        ; set the costumers'table are empty
        (empty_spot table_A) (empty_spot table_B)
        (empty_spot table_C) (empty_spot table_D)
    ) 
    
    (:goal
        (and (glass_at glass_A table_A) (drink_at drink_A table_A)
            (glass_at glass_B table_B) (drink_at drink_B table_B)
            (glass_at glass_C table_C) (drink_at drink_C table_C)
            (glass_at glass_D table_D) (drink_at drink_D table_D))
    )
)