import UIKit

enum FlightStatus: String {
    
    case enRoute
    case scheduled
    case cancelled
    case delayed
    case boarding
    
}

struct Airport {
    let destination: String
    let Arrival: Double
}

struct Flight {
    let departureTime: Date?
    var terminal: String?
    let status: FlightStatus
    
}


class DepartureBoard {
    var departureFlights: [Flight]
    var currentAirport: Airport
    
    init(departureFlights: [Flight], currentAirport: Airport) {
        self.departureFlights = departureFlights
        self.currentAirport = currentAirport
        
    }
    
    
    func alertPassengers() {
        for departures in departureFlights {
            let scheduled = "scheduled"
            let cancelled = "cancelled"
            if  scheduled == departures.status.rawValue {
                print("our flight to \(currentAirport.destination) is scheduled to depart at \(departures.departureTime) from terminal: \(departures.terminal)")
            } else if let terminal = departures.terminal {
                print("Your flight is boarding, please head to terminal: \(terminal) immediately. The doors are closing soon.")
            }  else if cancelled == departures.status.rawValue {
                print("We're sorry your flight to \(currentAirport.destination) was canceled, here is a $500 voucher")
            } else if let terminal = departures.terminal {
                print("TBD") {
                } else if let time = departures.departureTime {
                    print("TBD")
                }
               
            }
        }
    }
    
    
}

let flight252 = Flight(departureTime: nil, terminal: "A25", status: .scheduled)
let flight108 = Flight(departureTime: Date(), terminal: nil, status: .scheduled)
let flight090 = Flight(departureTime: Date(), terminal: "C12", status: .cancelled)

let ord = Airport(destination: "mco", Arrival: 12.00)
let mdw = Airport(destination: "las", Arrival: 08.00)

var spiritAirlines = DepartureBoard(departureFlights: [flight090], currentAirport: ord)


spiritAirlines.departureFlights.append(flight108)
spiritAirlines.departureFlights.append(flight252)


func printDepartures() {
    for departure in spiritAirlines.departureFlights {
        print("The departure time is \(departure.departureTime) and status is \(departure.status)")
    }
    
}
printDepartures()

func printDepartures2() {
    for departure in spiritAirlines.departureFlights {
        if let departTime = departure.departureTime {
            print("Destination: \(spiritAirlines.currentAirport.destination) Time: \(departTime) Status: \(departure.status.rawValue)")
        } else {
            print("Destination: \(spiritAirlines.currentAirport.destination) Time: TBD Status: \(departure.status.rawValue)")
        }
    }
}

printDepartures2()
