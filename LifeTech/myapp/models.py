from django.db import models

# Create your models here.
class Appointments(models.Model):
    apptmnt_id = models.IntegerField(db_column='Apptmnt_ID', primary_key=True)  # Field name made lowercase.
    scheduled_on = models.DateField(db_column='Scheduled_On')  # Field name made lowercase.
    date = models.DateField(db_column='Date')  # Field name made lowercase.
    time = models.TimeField(db_column='Time')  # Field name made lowercase.
    doc = models.OneToOneField('Doctor', models.DO_NOTHING, db_column='Doc_ID')  # Field name made lowercase.
    pat = models.OneToOneField('Patient', models.DO_NOTHING, db_column='Pat_ID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'appointments'
        
class Department(models.Model):
    dept_id = models.IntegerField(db_column='Dept_ID', primary_key=True)  # Field name made lowercase.
    dept_head = models.CharField(db_column='Dept_Head', max_length=20)  # Field name made lowercase.
    dept_name = models.CharField(db_column='Dept_Name', max_length=15)  # Field name made lowercase.
    emp_count = models.IntegerField(db_column='Emp_Count', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'department'


class Diagnosis(models.Model):
    diag_no = models.IntegerField(db_column='Diag_No', primary_key=True)  # Field name made lowercase.
    name = models.TextField(db_column='Name')  # Field name made lowercase.
    details = models.TextField(db_column='Details')  # Field name made lowercase.
    remark = models.TextField(db_column='Remark')  # Field name made lowercase.
    date = models.DateTimeField(db_column='Date')  # Field name made lowercase.
    pat = models.OneToOneField('Patient', models.DO_NOTHING, db_column='Pat_ID')  # Field name made lowercase.
    doc_id = models.IntegerField(db_column='Doc_ID', unique=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'diagnosis'
        
class Doctor(models.Model):
    doc_id = models.IntegerField(db_column='Doc_ID', primary_key=True)  # Field name made lowercase.
    name = models.TextField(db_column='Name')  # Field name made lowercase.
    surname = models.TextField(db_column='Surname')  # Field name made lowercase.
    mobile_number = models.IntegerField(db_column='Mobile Number')  # Field name made lowercase. Field renamed to remove unsuitable characters.
    department = models.TextField(db_column='Department')  # Field name made lowercase.
    insti = models.OneToOneField('HealthInstitution', models.DO_NOTHING, db_column='Insti_ID')  # Field name made lowercase.
    status = models.TextField(db_column='Status')  # Field name made lowercase.
    address = models.CharField(db_column='Address', max_length=50)  # Field name made lowercase.
    email = models.CharField(db_column='Email', max_length=20)  # Field name made lowercase.
    password = models.CharField(db_column='Password', max_length=20)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'doctor'


class EmergencyContact(models.Model):
    contact_id = models.IntegerField(db_column='Contact_ID', primary_key=True)  # Field name made lowercase.
    contact_name = models.CharField(db_column='Contact_Name', max_length=20)  # Field name made lowercase.
    phone = models.CharField(db_column='Phone', max_length=12)  # Field name made lowercase.
    relation = models.CharField(db_column='Relation', max_length=20)  # Field name made lowercase.
    pat = models.ForeignKey('Patient', models.DO_NOTHING, db_column='Pat_ID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'emergency_contact'


class HealthInstitution(models.Model):
    insti = models.OneToOneField('Patient', models.DO_NOTHING, db_column='Insti_ID', primary_key=True)  # Field name made lowercase.
    name = models.TextField(db_column='Name')  # Field name made lowercase.
    type = models.TextField(db_column='Type')  # Field name made lowercase.
    location = models.CharField(db_column='Location', max_length=50)  # Field name made lowercase.
    status = models.TextField(db_column='Status')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'health institution'


class Insurance(models.Model):
    policy_number = models.CharField(db_column='Policy_Number', primary_key=True, max_length=20)  # Field name made lowercase.
    pat = models.ForeignKey('Patient', models.DO_NOTHING, db_column='Pat_ID')  # Field name made lowercase.
    ins_code = models.CharField(db_column='Ins_Code', max_length=20)  # Field name made lowercase.
    end_date = models.CharField(db_column='End_Date', max_length=10, blank=True, null=True)  # Field name made lowercase.
    provider = models.CharField(db_column='Provider', max_length=20, blank=True, null=True)  # Field name made lowercase.
    plan = models.CharField(db_column='Plan', max_length=20, blank=True, null=True)  # Field name made lowercase.
    coverage = models.CharField(db_column='Coverage', max_length=20, blank=True, null=True)  # Field name made lowercase.
    maternity = models.IntegerField(db_column='Maternity', blank=True, null=True)  # Field name made lowercase.
    dental = models.IntegerField(db_column='Dental', blank=True, null=True)  # Field name made lowercase.
    optical = models.IntegerField(db_column='Optical', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'insurance'


class LabScreening(models.Model):
    lab_id = models.IntegerField(db_column='Lab_ID', primary_key=True)  # Field name made lowercase.
    pat = models.ForeignKey('Patient', models.DO_NOTHING, db_column='Pat_ID')  # Field name made lowercase.
    technician_id = models.IntegerField(db_column='Technician_ID')  # Field name made lowercase.
    doc = models.ForeignKey(Doctor, models.DO_NOTHING, db_column='Doc_ID')  # Field name made lowercase.
    test_cost = models.DecimalField(db_column='Test_Cost', max_digits=10, decimal_places=2, blank=True, null=True)  # Field name made lowercase.
    date = models.DateField(db_column='Date')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'lab_screening'


class MedicalHistory(models.Model):
    record_id = models.IntegerField(db_column='Record_ID', primary_key=True)  # Field name made lowercase.
    pat = models.ForeignKey('Patient', models.DO_NOTHING, db_column='Pat_ID')  # Field name made lowercase.
    allergies = models.CharField(db_column='Allergies', max_length=50, blank=True, null=True)  # Field name made lowercase.
    pre_conditions = models.CharField(db_column='Pre_Conditions', max_length=50, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'medical_history'


class MedicinePayments(models.Model):
    medpay_id = models.IntegerField(db_column='MedPay_ID', primary_key=True)  # Field name made lowercase.
    pat = models.OneToOneField('Patient', models.DO_NOTHING, db_column='Pat_ID')  # Field name made lowercase.
    pharm = models.OneToOneField('Pharmacist', models.DO_NOTHING, db_column='Pharm_ID')  # Field name made lowercase.
    med = models.OneToOneField('Medicines', models.DO_NOTHING, db_column='Med_ID')  # Field name made lowercase.
    doc = models.ForeignKey(Doctor, models.DO_NOTHING, db_column='Doc_ID')  # Field name made lowercase.
    date_and_time = models.DateTimeField(db_column='Date and Time')  # Field name made lowercase. Field renamed to remove unsuitable characters.
    amount = models.FloatField(db_column='Amount', blank=True, null=True)  # Field name made lowercase.
    quantity = models.IntegerField(db_column='Quantity')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'medicine payments'


class Medicines(models.Model):
    med_id = models.IntegerField(db_column='Med_ID', primary_key=True)  # Field name made lowercase.
    name = models.CharField(db_column='Name', max_length=50)  # Field name made lowercase.
    price = models.IntegerField(db_column='Price')  # Field name made lowercase.
    quantity = models.IntegerField(db_column='Quantity')  # Field name made lowercase.
    status = models.TextField(db_column='Status')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'medicines'


class Nurse(models.Model):
    nurse_id = models.IntegerField(db_column='Nurse_ID', primary_key=True)  # Field name made lowercase.
    name = models.TextField(db_column='Name')  # Field name made lowercase.
    surname = models.TextField(db_column='Surname')  # Field name made lowercase.
    mobile_number = models.IntegerField(db_column='Mobile Number')  # Field name made lowercase. Field renamed to remove unsuitable characters.
    email = models.TextField(db_column='Email')  # Field name made lowercase.
    address = models.CharField(db_column='Address', max_length=50)  # Field name made lowercase.
    status = models.TextField(db_column='Status')  # Field name made lowercase.
    department = models.TextField(db_column='Department')  # Field name made lowercase.
    insti = models.OneToOneField(HealthInstitution, models.DO_NOTHING, db_column='Insti_ID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'nurse'


class Patient(models.Model):
    id_number = models.CharField(db_column='ID_Number', primary_key=True, max_length=20)  # Field name made lowercase.
    name = models.TextField(db_column='Name')  # Field name made lowercase.
    surname = models.TextField(db_column='Surname')  # Field name made lowercase.
    address = models.CharField(db_column='Address', max_length=50)  # Field name made lowercase.
    mobile_number = models.IntegerField(db_column='Mobile Number')  # Field name made lowercase. Field renamed to remove unsuitable characters.
    email = models.CharField(db_column='Email', max_length=50)  # Field name made lowercase.
    password = models.CharField(db_column='Password', max_length=20)  # Field name made lowercase.
    age = models.IntegerField(db_column='Age')  # Field name made lowercase.
    gender = models.TextField(db_column='Gender')  # Field name made lowercase.
    insti_id = models.IntegerField(db_column='Insti_ID', unique=True)  # Field name made lowercase.
    description = models.TextField(db_column='Description')  # Field name made lowercase.
    status = models.TextField(db_column='Status')  # Field name made lowercase.
    admission_date = models.DateField(db_column='Admission_Date')  # Field name made lowercase.
    discharge_date = models.DateField(db_column='Discharge_Date')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'patient'


class Payments(models.Model):
    receipt_number = models.IntegerField(db_column='Receipt Number', primary_key=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.
    pat = models.ForeignKey(Patient, models.DO_NOTHING, db_column='Pat_ID')  # Field name made lowercase.
    doc = models.ForeignKey(Doctor, models.DO_NOTHING, db_column='Doc_ID')  # Field name made lowercase.
    date_and_time = models.DateTimeField(db_column='Date and Time')  # Field name made lowercase. Field renamed to remove unsuitable characters.
    amount = models.FloatField(db_column='Amount', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'payments'


class Pharmacist(models.Model):
    pharm_id = models.IntegerField(db_column='Pharm_ID', primary_key=True)  # Field name made lowercase.
    name = models.TextField(db_column='Name')  # Field name made lowercase.
    surname = models.TextField(db_column='Surname')  # Field name made lowercase.
    mobile_number = models.IntegerField(db_column='Mobile Number')  # Field name made lowercase. Field renamed to remove unsuitable characters.
    address = models.CharField(db_column='Address', max_length=50)  # Field name made lowercase.
    email = models.CharField(db_column='Email', max_length=20)  # Field name made lowercase.
    password = models.IntegerField(db_column='Password')  # Field name made lowercase.
    insti_id = models.IntegerField(db_column='Insti_ID', unique=True)  # Field name made lowercase.
    status = models.TextField(db_column='Status')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'pharmacist'


class Prescription(models.Model):
    prescription_id = models.IntegerField(db_column='Prescription_ID', primary_key=True)  # Field name made lowercase.
    pat = models.ForeignKey(Patient, models.DO_NOTHING, db_column='Pat_ID')  # Field name made lowercase.
    med = models.ForeignKey(Medicines, models.DO_NOTHING, db_column='Med_ID')  # Field name made lowercase.
    date_field = models.DateField(db_column='Date_', blank=True, null=True)  # Field name made lowercase. Field renamed because it ended with '_'.
    dosage = models.IntegerField(db_column='Dosage', blank=True, null=True)  # Field name made lowercase.
    doc = models.ForeignKey(Doctor, models.DO_NOTHING, db_column='Doc_ID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'prescription'


class Receptionist(models.Model):
    id = models.IntegerField(db_column='ID', primary_key=True)  # Field name made lowercase.
    name = models.TextField(db_column='Name')  # Field name made lowercase.
    surname = models.TextField(db_column='Surname')  # Field name made lowercase.
    mobile_number = models.IntegerField(db_column='Mobile Number')  # Field name made lowercase. Field renamed to remove unsuitable characters.
    email = models.CharField(db_column='Email', max_length=100)  # Field name made lowercase.
    password = models.CharField(db_column='Password', max_length=20)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'receptionist'


class Room(models.Model):
    room_id = models.IntegerField(db_column='Room_ID', primary_key=True)  # Field name made lowercase.
    room_type = models.CharField(db_column='Room_Type', max_length=50)  # Field name made lowercase.
    pat = models.ForeignKey(Patient, models.DO_NOTHING, db_column='Pat_ID')  # Field name made lowercase.
    room_cost = models.DecimalField(db_column='Room_Cost', max_digits=10, decimal_places=2, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'room'
