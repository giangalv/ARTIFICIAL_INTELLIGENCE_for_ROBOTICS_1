(define (domain intermodal)

    (:requirements :strips)
    
    (:predicates
        (CONTAINER ?c)
        (TRUCK ?r)
        ; A station is also a hub
        (HUB ?h)
        (STATION ?s)
        
        (train_connected ?s1 ?s2)
        (truck_connected ?h1 ?h2)
        (container_batch ?c1 ?c2 ?c3 ?c4)

        (container_at ?c ?h)
        (truck_at ?r ?h)
        (train_at ?s)
        (loaded_truck ?r ?c)
        (empty_truck ?r)
        (loaded_train ?c1 ?c2 ?c3 ?c4)
        (empty_train)
        
    )
    
    (:action move_truck
        :parameters (?r ?h1 ?h2)
        :precondition (and (TRUCK ?r) (HUB ?h1) (HUB ?h2)
                            (truck_connected ?h1 ?h2) (truck_at ?r ?h1))
        :effect (and (truck_at ?r ?h2) (not (truck_at ?r ?h1)))
    )
    
    (:action move_train
        :parameters (?s1 ?s2)
        :precondition (and  (STATION ?s1) (STATION ?s2)
                            (train_connected ?s1 ?s2) (train_at ?s1))
        :effect (and (train_at ?s2) (not (train_at ?s1)))
    )
    
    (:action load_truck
        :parameters (?r ?h ?c)
        :precondition (and (TRUCK ?r) (HUB ?h) (CONTAINER ?c)
                            (truck_at ?r ?h) (container_at ?c ?h) (empty_truck ?r))
        :effect (and (loaded_truck ?r ?c) (not (container_at ?c ?h)) (not (empty_truck ?r)))
    )
    
    (:action load_train
        :parameters (?s ?c1 ?c2 ?c3 ?c4)
        :precondition (and  (STATION ?s) (CONTAINER ?c1) (CONTAINER ?c2) (CONTAINER ?c3) (CONTAINER ?c4)
                            (train_at ?s) (empty_train)
                            (container_at ?c1 ?s) (container_at ?c2 ?s)
                            (container_at ?c3 ?s) (container_at ?c4 ?s)
                            (container_batch ?c1 ?c2 ?c3 ?c4))
        :effect (and (loaded_train ?c1 ?c2 ?c3 ?c4) 
                    (not (container_at ?c1 ?s))
                    (not (container_at ?c2 ?s))
                    (not (container_at ?c3 ?s))
                    (not (container_at ?c4 ?s))
                    (not (empty_train)))
    )

    (:action unload_truck
        :parameters (?r ?h ?c)
        :precondition (and (TRUCK ?r) (HUB ?h) (CONTAINER ?c)
                            (truck_at ?r ?h) (loaded_truck ?r ?c))
        :effect (and (container_at ?c ?h) (empty_truck ?r) (not (loaded_truck ?r ?c)))
    )
    
    (:action unload_train
        :parameters (?s ?c1 ?c2 ?c3 ?c4)
        :precondition (and (STATION ?s) (CONTAINER ?c1) (CONTAINER ?c2) (CONTAINER ?c3) (CONTAINER ?c4)
                            (train_at ?s) (loaded_train ?c1 ?c2 ?c3 ?c4) 
                            (container_batch ?c1 ?c2 ?c3 ?c4))
        :effect (and (container_at ?c1 ?s)
                    (container_at ?c2 ?s)
                    (container_at ?c3 ?s)
                    (container_at ?c4 ?s)
                    (empty_train)
                    (not (loaded_train ?c1 ?c2 ?c3 ?c4)))
    )
    
)
