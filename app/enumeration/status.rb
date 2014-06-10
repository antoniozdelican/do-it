class Status < Enumeration::Base
  values  completed: { id: 1, name: "Completed" },
          pending: { id: 2, name: "Pending" },
          late: { id: 3, name: "Late" },
          canceled: { id: 4, name: "Canceled" }
end