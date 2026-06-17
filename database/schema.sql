-- Medical AI Assistant
-- Healthcare Operations Database Schema v1

CREATE TABLE patients (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(120) NOT NULL,
    date_of_birth DATE,
    phone VARCHAR(30),
    email VARCHAR(120),
    status VARCHAR(30) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE healthcare_staff (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(120) NOT NULL,
    role VARCHAR(80),
    department VARCHAR(80),
    status VARCHAR(30) DEFAULT 'active',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE appointments (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients(id),
    staff_id INTEGER REFERENCES healthcare_staff(id),
    appointment_date DATE NOT NULL,
    appointment_time TIME,
    status VARCHAR(30) DEFAULT 'scheduled',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE medical_notes (
    id SERIAL PRIMARY KEY,
    patient_id INTEGER REFERENCES patients(id),
    staff_id INTEGER REFERENCES healthcare_staff(id),
    note_type VARCHAR(80),
    summary TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE operational_insights (
    id SERIAL PRIMARY KEY,
    insight_type VARCHAR(80),
    summary TEXT,
    recommendation TEXT,
    confidence_score DECIMAL(5,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX idx_appointments_patient ON appointments(patient_id);
CREATE INDEX idx_appointments_staff ON appointments(staff_id);
CREATE INDEX idx_notes_patient ON medical_notes(patient_id);
