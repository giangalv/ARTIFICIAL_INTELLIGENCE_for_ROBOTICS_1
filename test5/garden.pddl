(define (domain garden)

    (:requirements :strips)
    
    (:predicates 
        (PLANT ?p)
        ; SPOT contains crate and store
        (SPOT ?s)
        (VASE ?v)
        
        (robot_conected ?s1 ?s2)
        (robot_at ?s)
        
        (empty_spot ?s)
        
        (carry_vase_plant ?v ?p)
        (carry_plant ?p)
        
        (plant_at ?p ?s)
        (vase_at ?v ?s)
        (empty_robot)
    )
    
    (:action move
        :parameters (?s1 ?s2)
        
        :precondition (and (SPOT ?s1) (SPOT ?s2)
                        (robot_at ?s1) (robot_conected ?s1 ?s2))
                        
        :effect (and (robot_at ?s2) (not (robot_at ?s1)))
    )
    
    (:action take_plant
        :parameters (?p ?s)
        
        :precondition (and (PLANT ?p) (SPOT ?s)
                        (robot_at ?s) (plant_at ?p ?s)
                        (empty_robot))
                    
                        
        :effect (and (carry_plant ?p) (not (plant_at ?p ?s)) (not (empty_robot)))
    )
    
    (:action take_vase
        :parameters (?p ?v ?s)
        
        :precondition (and (PLANT ?p) (VASE ?v) (SPOT ?s)
                        (robot_at ?s) (vase_at ?v ?s) (carry_plant ?p))
                        
        :effect (and (carry_vase_plant ?v ?p) (not (vase_at ?v ?s)))
    )
    
    (:action place_vase_plant
        :parameters (?p ?v ?s)
        
        :precondition (and (PLANT ?p) (VASE ?v) (SPOT ?s)
                            (carry_vase_plant ?v ?p) (robot_at ?s)
                            (empty_spot ?s) (carry_plant ?p))
                            
        :effect (and (vase_at ?v ?s) (plant_at ?p ?s) (empty_robot)
                    (not (empty_spot ?s)) (not (carry_vase_plant ?v ?p)) (not (carry_plant ?p)))
    )

)