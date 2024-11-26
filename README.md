
### How to test API


Create a new e-transportation

```bash
curl -X POST http://localhost:3000/api/v1/e_transportations \
  -H "Content-Type: application/json" \
  -d '{
    "e_transportation": {
      "transportation_type": "e-Scooter",
      "sensor_type": "GPS",
      "owner_id": 1,
      "in_zone": true
    }
  }'
```


Get all e-transportations
```bash
curl -X GET http://localhost:3000/api/v1/e_transportations \
  -H "Content-Type: application/json"
```
