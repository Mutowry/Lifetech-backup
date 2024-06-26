# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


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


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'
        unique_together = (('group', 'permission'),)


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


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


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


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
