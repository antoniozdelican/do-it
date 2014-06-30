class Status < Enumeration::Base
  values  completed: { id: 1, name: "Completed" },
          pending: { id: 2, name: "Pending" },
          canceled: { id: 3, name: "Canceled" }
end