from fastapi import FastAPI
from pydantic import BaseModel
from typing import List

app = FastAPI(
    title="Medical AI Assistant API",
    description="Healthcare operations and medical information intelligence prototype API.",
    version="0.1.0"
)

class Patient(BaseModel):
    id: int
    full_name: str
    status: str

class Appointment(BaseModel):
    id: int
    patient_id: int
    doctor_name: str
    appointment_date: str
    status: str

patients = [
    Patient(id=1, full_name="John Smith", status="active"),
    Patient(id=2, full_name="Emma Brown", status="active")
]

appointments = [
    Appointment(
        id=1,
        patient_id=1,
        doctor_name="Dr. Adams",
        appointment_date="2026-06-20",
        status="scheduled"
    )
]

@app.get("/")
def root():
    return {
        "project": "Medical AI Assistant",
        "status": "running"
    }

@app.get("/health")
def health():
    return {"status": "ok"}

@app.get("/patients", response_model=List[Patient])
def get_patients():
    return patients

@app.get("/appointments", response_model=List[Appointment])
def get_appointments():
    return appointments

@app.get("/operations/summary")
def operations_summary():
    return {
        "total_patients": len(patients),
        "appointments": len(appointments),
        "active_records": len(patients),
        "recommendation": "Review appointment scheduling and operational workload."
    }

@app.get("/medical/insights")
def medical_insights():
    return {
        "insight_type": "operational",
        "summary": "Healthcare information processed successfully.",
        "status": "available"
    }
