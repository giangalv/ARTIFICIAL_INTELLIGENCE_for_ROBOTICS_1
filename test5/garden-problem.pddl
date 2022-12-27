(define (problem garden-problem)
    
    (:domain garden)
    
    (:objects
        plantA plantB plantC plantD
        vaseA vaseB vaseC vaseD
        spot_A spot_B spot_C spot_D
        crate store
    )
    
    (:init
        (PLANT plantA) (PLANT plantB) (PLANT plantC) (PLANT plantD)
        (VASE vaseA) (VASE vaseB) (VASE vaseC) (VASE vaseD)
        (SPOT spot_A) (SPOT spot_B) (SPOT spot_C) (SPOT spot_D)
        (SPOT crate) (SPOT store)
        
        (robot_conected crate store) (robot_conected store crate)
        
        (robot_conected store spot_A) (robot_conected spot_A crate)
        (robot_conected store spot_B) (robot_conected spot_B crate)
        
        (robot_conected spot_A spot_C) (robot_conected spot_C spot_A)
        (robot_conected spot_B spot_D) (robot_conected spot_D spot_B)
        
        (robot_at crate) (empty_robot)
        
        (plant_at plantA crate) (plant_at plantB crate)
        (plant_at plantC crate) (plant_at plantD crate)
        
        (vase_at vaseA store) (vase_at vaseB store)
        (vase_at vaseC store) (vase_at vaseD store)
        
        (empty_spot spot_A) (empty_spot spot_B)
        (empty_spot spot_C) (empty_spot spot_D)
        
    )
    
    (:goal
        (and (plant_at plantA spot_A) (vase_at vaseA spot_A)
            (plant_at plantB spot_B) (vase_at vaseB spot_B)
            (plant_at plantC spot_C) (vase_at vaseC spot_C)
            (plant_at plantD spot_D) (vase_at vaseD spot_D)
        )
    )
)