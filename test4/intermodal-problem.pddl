(define (problem intermodal-problem)

    (:domain intermodal)

    (:objects 
        truck_1 truck_2 truck_3 truck_4
        hub_IT_1 hub_IT_2 hub_FR_1 hub_FR_2
        station_IT station_FR
        itu_1 itu_2 itu_3 itu_4 itu_5 itu_6 itu_7 itu_8
    )
    
    (:init
        ; Containers, trucks, hubs and stations
        (CONTAINER itu_1) (CONTAINER itu_2) (CONTAINER itu_3) (CONTAINER itu_4)
        (CONTAINER itu_5) (CONTAINER itu_6) (CONTAINER itu_7) (CONTAINER itu_8)
        (TRUCK truck_1) (TRUCK truck_2) (TRUCK truck_3) (TRUCK truck_4)
        (HUB hub_IT_1) (HUB hub_IT_2) (HUB hub_FR_1) (HUB hub_FR_2)
        (HUB station_IT) (HUB station_FR)
        (STATION station_IT) (STATION station_FR)
        
        ; Only some batches of containers are allowed to travel on train
        ; NOTICE: this limits the amount of potential plans; to enable
        ; more plans to be searched one could specify additional batches
        (container_batch itu_1 itu_2 itu_3 itu_4)
        (container_batch itu_5 itu_6 itu_7 itu_8)
        
        ; IT and FR stations are connected
        (train_connected station_IT station_FR) 
        (train_connected station_FR station_IT)
        
        ; Stations and hubs are connected within the same nation
        (truck_connected hub_IT_1 station_IT) (truck_connected station_IT hub_IT_2)
        (truck_connected hub_IT_2 station_IT) (truck_connected station_IT hub_IT_2)
        
        (truck_connected hub_FR_1 station_FR) (truck_connected station_FR hub_FR_2)
        (truck_connected hub_FR_2 station_FR) (truck_connected station_FR hub_FR_2)
        
        (truck_connected hub_IT_1 hub_IT_2) (truck_connected hub_IT_2 hub_IT_1)
        (truck_connected hub_FR_1 hub_FR_2) (truck_connected hub_FR_2 hub_FR_1)
        
        
        ; Containers are initially in IT (four per hub)
        (container_at itu_1 hub_IT_1)
        (container_at itu_2 hub_IT_1)
        (container_at itu_3 hub_IT_1)
        (container_at itu_4 hub_IT_1)
        (container_at itu_5 hub_IT_2)
        (container_at itu_6 hub_IT_2)
        (container_at itu_7 hub_IT_2)
        (container_at itu_8 hub_IT_2)
        
        ; One truck per hub
        (truck_at truck_1 hub_IT_1)
        (truck_at truck_2 hub_IT_2)
        (truck_at truck_3 hub_FR_1)
        (truck_at truck_4 hub_FR_2)
        
        ; Train initially in IT
        (train_at station_IT)
        
        ; All trucks are empty
        (empty_truck truck_1)
        (empty_truck truck_2)
        (empty_truck truck_3)
        (empty_truck truck_4)
        
        ; Train is empty
        (empty_train)
    )
    
    (:goal
	(and 
	(container_at itu_1 hub_FR_1)
        (container_at itu_2 hub_FR_1)
        (container_at itu_3 hub_FR_1)
        (container_at itu_4 hub_FR_1)
        (container_at itu_5 hub_FR_2)
        (container_at itu_6 hub_FR_2)
        (container_at itu_7 hub_FR_2)
        (container_at itu_8 hub_FR_2))
	
    )
    

)
