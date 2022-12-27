(define (domain domain_bar)
    
    (:requirements :strips)
    
    (:predicates
        (GLASS ?g)
        ; spot contains the shelf the dispencer and the four table for the costumers
        (SPOT ?s)
        (DRINK ?d)
        
        ; to know where is the robot
        (robot_at ?s)
        
        ;to know if the robot is busy
        (empty_robot)
        
        ; to know if the table or shelf has a glass/drink
        (empty_spot ?s)
        
        ; to know where is the glass
        (glass_at ?g ?s)
        
        ; to know if the robot is carrying a glass
        (carry_glass ?g)
        
        ;to know if the drink is in the glass
        (carry_drink ?d ?g)
        ;
        
        (drink_at ?d ?s)
    )
    
    ;bar_tender robot moving from spot to spot
    (:action fetch_to
        :parameters (?s1 ?s2)
        
        :precondition (and (SPOT ?s1) (SPOT ?s2)
                        (robot_at ?s1))
        
        :effect (and (robot_at ?s2) (not (robot_at ?s1)))
    )
    
    ; take the glass empty
    (:action hook
        :parameters (?g ?s)
        
        :precondition (and (GLASS ?g) (SPOT ?s)
                        (robot_at ?s) (glass_at ?g ?s)
                        (empty_robot))
                        
        :effect (and (carry_glass ?g) (not (glass_at ?g ?s)) (not (empty_robot)))
    )
    
    ; fill up the glass with the drink
    (:action fill_up
        :parameters (?g ?s ?d)
        
        :precondition (and (GLASS ?g) (SPOT ?s) (DRINK ?d)
                        (robot_at ?s) (carry_glass ?g) (drink_at ?d ?s))
        
        :effect (and (carry_drink ?d ?g) (not (drink_at ?d ?s)))
    )
    
    ; serve the drink to the free costumer (free spot/table)
    (:action serve
        :parameters (?g ?s ?d)
        
        :precondition (and (GLASS ?g) (SPOT ?s) (DRINK ?d)
                        (robot_at ?s) (empty_spot ?s)
                        (carry_drink ?d ?g) (carry_glass ?g))
        
        :effect (and (drink_at ?d ?s) (glass_at ?g ?s) (empty_robot)
                    (not (empty_spot ?s)) (not (carry_drink ?d ?g)) (not (carry_glass ?g)))
    )
)