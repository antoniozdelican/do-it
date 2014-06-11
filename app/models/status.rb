class Status < Enumeration::Base
  values  pending: { id: 1, name: "Pending" },
          completed: { id: 2, name: "Completed" },
          canceled: { id: 3, name: "Canceled" }
end