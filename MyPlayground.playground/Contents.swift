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
            let cancelled = "cancelled"
            if let departure = departures.departureTime, let terminal = departures.terminal {
                print("Our flight to \(currentAirport.destination) is scheduled to depart at \(departure) from terminal: \(terminal)")
            } else if let terminal = departures.terminal {
                print("Your flight is boarding, please head to terminal: \(terminal) immediately. The doors are closing soon.")
            }  else if cancelled == departures.status.rawValue {
                print("We're sorry your flight to \(currentAirport.destination) was canceled, here is a $500 voucher")
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
spiritAirlines.alertPassengers()

func calculateAirfare(checkedBags multipledBy: Int, distance inMilesAnd: Int, travelers inParty: Int) -> String {
    let airFareInDouble = Double(multipledBy * inMilesAnd * inParty)
    let airFareInUSD = String(format: "$%.02f", airFareInDouble)
    print("\(airFareInUSD)")

    return airFareInUSD
    
}

calculateAirfare(checkedBags: 2, distance: 1259, travelers: 2)
