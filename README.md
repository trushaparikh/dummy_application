# README

Dummy Apllication is for booking appointments of Doctor abd patient. Doctor can choose his/her avaibility. patient can choose doctor and available slots for booking appointment.

* Versions

**ruby: 2.7.0**

**rails: 6.0.3**

Setup the application

1. `bundle install`
2. `rails db:setup`
3. `rails db:migrate`
4. `rails db:seed`

login cred for doctor (If you have run seed, otherwise you have to create it manually)

email: doctor@gmail.com, password: hello123

login cred for patient (If you have run seed, otherwise you have to create it manually)

email: patient@gmail.com, password: hello123


**API Documentation**

Writing it here as it has very few APIs.

1) Login for doctor or patient

```
curl --location --request POST 'localhost:3000/api/v1/oauth/token' \
--header 'Content-Type: application/json' \
--data-raw '{  "email": "doctor@gmail.com",  "password": "hello123", "grant_type": "password"}'
```

**Response**
```
{
  "access_token": "mPsLbtJp6t6zIHo85e8MKT-p2PbXKzS3X7-NpcdZ_oo",
  "token_type": "Bearer",
  "created_at": 1203707880
}
```

2) Create available time slot for doctor

```
curl --location --request POST 'localhost:3000/api/v1/doctors/:doctor_id/available_slots' \
--header 'Authorization: bearer <access_token>' \
--header 'Content-Type: application/json' \
--data-raw '{
    "day": "monday",
    "start_time": 1203730544,
    "end_time": 1203734147
}'
```

**Response**

```
{
    "success": true,
    "message": "AvailableSlot created successfully",
    "data": {
        "id": 10,
        "doctor_id": 1,
        "created_at": "2020-11-27T07:42:45.748-07:00",
        "updated_at": "2020-11-27T07:42:45.748-07:00",
        "day": "monday",
        "start_time": 1203730544,
        "end_time": 1203734147
    },
    "meta": [],
    "errors": []
}
```

3) Fetch available time slots of doctor on particular date

```
curl --location --request GET 'localhost:3000/api/v1/doctors/:doctor_id/available_slots/search?appointment_date=28/11/2020' \
--header 'Authorization: bearer <access_token>' \
--header 'Content-Type: application/json'
```

**Response**

```
{
    "success": true,
    "message": "",
    "data": [
        {
            "id": 18,
            "doctor_id": 1,
            "created_at": "2020-11-27T14:42:45.748Z",
            "updated_at": "2020-11-27T14:42:45.748Z",
            "day": "monday",
            "start_time": 1203730544,
            "end_time": 1203734147
        }
    ],
    "meta": [],
    "errors": []
}
```
4) Create an appointment with doctor

```
curl --location --request POST 'localhost:3000/api/v1/appointments' \
--header 'Authorization: bearer <access_token>' \
--header 'Content-Type: application/json' \
--data-raw '{
    "doctor_id": 1,
    "patient_id": 1,
    "available_slot_id": 18,
    "appointment_date": "27/11/2020"
}'
```

**Response**
```
{
    "success": true,
    "message": "Appointment created successfully",
    "data": {
        "id": 11,
        "doctor_id": 1,
        "patient_id": 1,
        "created_at": "2020-11-27T15:40:39.136Z",
        "updated_at": "2020-11-27T15:40:39.136Z",
        "available_slot_id": 18,
        "appointment_date": "2020-11-27"
    },
    "meta": [],
    "errors": []
}
```
