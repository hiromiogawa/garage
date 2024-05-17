-- CreateEnum
CREATE TYPE "Frequency" AS ENUM ('week1', 'week2', 'week3', 'week4', 'month1', 'month2', 'month3', 'month4', 'month5', 'month6', 'month7', 'month8', 'month9', 'month10', 'month11', 'year1', 'year2', 'year3', 'year4', 'year5');

-- CreateEnum
CREATE TYPE "MakerName" AS ENUM ('TOYOTA', 'LEXUS', 'NISSAN', 'HONDA', 'MAZDA', 'SUBARU', 'MITSUBISHI', 'SUZUKI', 'DAIHATSU', 'ATHER');

-- CreateEnum
CREATE TYPE "Dot" AS ENUM ('DOT3', 'DOT4', 'DOT5');

-- CreateTable
CREATE TABLE "User" (
    "id" BIGSERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "email" TEXT NOT NULL,
    "isEnabled" BOOLEAN NOT NULL DEFAULT false,
    "refreshAoken" TEXT,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "User_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Maker" (
    "id" BIGSERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "isEnabled" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Maker_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Car" (
    "id" BIGSERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "makerId" BIGINT NOT NULL,
    "isEnabled" BOOLEAN NOT NULL DEFAULT false,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Car_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MyCar" (
    "id" BIGSERIAL NOT NULL,
    "userId" BIGINT NOT NULL,
    "mycarId" BIGINT NOT NULL,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MyCar_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MaintenanceItemActivation" (
    "id" BIGSERIAL NOT NULL,
    "mycarId" BIGINT NOT NULL,
    "engineOil" BOOLEAN NOT NULL DEFAULT true,
    "oilFilter" BOOLEAN NOT NULL DEFAULT true,
    "differentialGearOil" BOOLEAN NOT NULL DEFAULT false,
    "mtOil" BOOLEAN NOT NULL DEFAULT false,
    "brakeFluid" BOOLEAN NOT NULL DEFAULT false,
    "brakePad" BOOLEAN NOT NULL DEFAULT false,
    "diskBrake" BOOLEAN NOT NULL DEFAULT false,
    "llc" BOOLEAN NOT NULL DEFAULT false,
    "airConditionerFilter" BOOLEAN NOT NULL DEFAULT false,
    "airConditionerGas" BOOLEAN NOT NULL DEFAULT false,
    "airCleaner" BOOLEAN NOT NULL DEFAULT false,
    "tire" BOOLEAN NOT NULL DEFAULT true,
    "tirePressure" BOOLEAN NOT NULL DEFAULT true,
    "battery" BOOLEAN NOT NULL DEFAULT true,
    "powerSteeringOil" BOOLEAN NOT NULL DEFAULT false,
    "sparkPlug" BOOLEAN NOT NULL DEFAULT false,
    "coating" BOOLEAN NOT NULL DEFAULT false,
    "wax" BOOLEAN NOT NULL DEFAULT false,
    "wash" BOOLEAN NOT NULL DEFAULT true,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MaintenanceItemActivation_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "NoticeFrequency" (
    "id" BIGSERIAL NOT NULL,
    "mycarId" BIGINT NOT NULL,
    "engineOil" "Frequency" NOT NULL DEFAULT 'month3',
    "oilFilter" "Frequency" NOT NULL DEFAULT 'month6',
    "differentialGearOil" "Frequency" NOT NULL DEFAULT 'year2',
    "mtOil" "Frequency" NOT NULL DEFAULT 'year2',
    "brakeFluid" "Frequency" NOT NULL DEFAULT 'year2',
    "brakePad" "Frequency" NOT NULL DEFAULT 'year5',
    "diskBrake" "Frequency" NOT NULL DEFAULT 'year5',
    "llc" "Frequency" NOT NULL DEFAULT 'year2',
    "airConditionerFilter" "Frequency" NOT NULL DEFAULT 'year1',
    "airConditionerGus" "Frequency" NOT NULL DEFAULT 'year5',
    "airCleaner" "Frequency" NOT NULL DEFAULT 'year2',
    "tire" "Frequency" NOT NULL DEFAULT 'year4',
    "tirePressure" "Frequency" NOT NULL DEFAULT 'month1',
    "battery" "Frequency" NOT NULL DEFAULT 'year2',
    "powerSteering_oil" "Frequency" NOT NULL DEFAULT 'year2',
    "sparkPlug" "Frequency" NOT NULL DEFAULT 'year5',
    "coating" "Frequency" NOT NULL DEFAULT 'year1',
    "wax" "Frequency" NOT NULL DEFAULT 'month2',
    "wash" "Frequency" NOT NULL DEFAULT 'week1',
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "NoticeFrequency_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "EngineOil" (
    "id" BIGSERIAL NOT NULL,
    "mycarId" BIGINT NOT NULL,
    "maker" TEXT,
    "name" TEXT,
    "viscosity" TEXT,
    "liter" INTEGER,
    "implementationDate" TIMESTAMP(3) NOT NULL,
    "shopName" TEXT,
    "price" INTEGER,
    "mileage" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "EngineOil_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "OilFilter" (
    "id" BIGSERIAL NOT NULL,
    "mycarId" BIGINT NOT NULL,
    "maker" TEXT,
    "name" TEXT,
    "implementationDate" TIMESTAMP(3) NOT NULL,
    "shopName" TEXT,
    "price" INTEGER,
    "mileage" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "OilFilter_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DifferentialGearOil" (
    "id" BIGSERIAL NOT NULL,
    "mycarId" BIGINT NOT NULL,
    "maker" TEXT,
    "name" TEXT,
    "viscosity" TEXT,
    "liter" INTEGER,
    "implementationDate" TIMESTAMP(3) NOT NULL,
    "shopName" TEXT,
    "price" INTEGER,
    "mileage" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DifferentialGearOil_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "MtOil" (
    "id" BIGSERIAL NOT NULL,
    "mycarId" BIGINT NOT NULL,
    "maker" TEXT,
    "name" TEXT,
    "viscosity" TEXT,
    "liter" INTEGER,
    "implementationDate" TIMESTAMP(3) NOT NULL,
    "shopName" TEXT,
    "price" INTEGER,
    "mileage" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "MtOil_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BrakeFluid" (
    "id" BIGSERIAL NOT NULL,
    "mycarId" BIGINT NOT NULL,
    "maker" TEXT,
    "name" TEXT,
    "dot" "Dot",
    "liter" INTEGER,
    "implementationDate" TIMESTAMP(3) NOT NULL,
    "shopName" TEXT,
    "price" INTEGER,
    "mileage" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BrakeFluid_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "BrakePad" (
    "id" BIGSERIAL NOT NULL,
    "mycarId" BIGINT NOT NULL,
    "maker" TEXT,
    "name" TEXT,
    "implementationDate" TIMESTAMP(3) NOT NULL,
    "shopName" TEXT,
    "price" INTEGER,
    "mileage" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "BrakePad_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "DiskBrake" (
    "id" BIGSERIAL NOT NULL,
    "mycarId" BIGINT NOT NULL,
    "maker" TEXT,
    "name" TEXT,
    "implementationDate" TIMESTAMP(3) NOT NULL,
    "shopName" TEXT,
    "price" INTEGER,
    "mileage" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "DiskBrake_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "LLC" (
    "id" BIGSERIAL NOT NULL,
    "mycarId" BIGINT NOT NULL,
    "maker" TEXT,
    "name" TEXT,
    "liter" INTEGER,
    "implementationDate" TIMESTAMP(3) NOT NULL,
    "shopName" TEXT,
    "price" INTEGER,
    "mileage" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "LLC_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AirConditionerFilter" (
    "id" BIGSERIAL NOT NULL,
    "mycarId" BIGINT NOT NULL,
    "implementationDate" TIMESTAMP(3) NOT NULL,
    "shopName" TEXT,
    "price" INTEGER,
    "mileage" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AirConditionerFilter_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AirConditionerGas" (
    "id" BIGSERIAL NOT NULL,
    "mycarId" BIGINT NOT NULL,
    "implementationDate" TIMESTAMP(3) NOT NULL,
    "shopName" TEXT,
    "price" INTEGER,
    "mileage" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AirConditionerGas_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "AirCleaner" (
    "id" BIGSERIAL NOT NULL,
    "mycarId" BIGINT NOT NULL,
    "maker" TEXT,
    "name" TEXT,
    "implementationDate" TIMESTAMP(3) NOT NULL,
    "shopName" TEXT,
    "price" INTEGER,
    "mileage" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "AirCleaner_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tire" (
    "id" BIGSERIAL NOT NULL,
    "mycarId" BIGINT NOT NULL,
    "maker" TEXT,
    "name" TEXT,
    "size" TEXT,
    "implementationDate" TIMESTAMP(3) NOT NULL,
    "shopName" TEXT,
    "price" INTEGER,
    "mileage" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Tire_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "TirePressure" (
    "id" BIGSERIAL NOT NULL,
    "mycarId" BIGINT NOT NULL,
    "pressureLf" INTEGER,
    "pressureLr" INTEGER,
    "pressureRf" INTEGER,
    "pressureRr" INTEGER,
    "implementationDate" TIMESTAMP(3) NOT NULL,
    "shopName" TEXT,
    "price" INTEGER,
    "mileage" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "TirePressure_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Battery" (
    "id" BIGSERIAL NOT NULL,
    "mycarId" BIGINT NOT NULL,
    "maker" TEXT,
    "name" TEXT,
    "implementationDate" TIMESTAMP(3) NOT NULL,
    "shopName" TEXT,
    "price" INTEGER,
    "mileage" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Battery_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "PowerSteeringOil" (
    "id" BIGSERIAL NOT NULL,
    "mycarId" BIGINT NOT NULL,
    "maker" TEXT,
    "name" TEXT,
    "liter" INTEGER,
    "implementationDate" TIMESTAMP(3) NOT NULL,
    "shopName" TEXT,
    "price" INTEGER,
    "mileage" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "PowerSteeringOil_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "SparkPlug" (
    "id" BIGSERIAL NOT NULL,
    "mycarId" BIGINT NOT NULL,
    "maker" TEXT,
    "name" TEXT,
    "implementationDate" TIMESTAMP(3) NOT NULL,
    "shopName" TEXT,
    "price" INTEGER,
    "mileage" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "SparkPlug_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Coating" (
    "id" BIGSERIAL NOT NULL,
    "mycarId" BIGINT NOT NULL,
    "maker" TEXT,
    "name" TEXT,
    "implementationDate" TIMESTAMP(3) NOT NULL,
    "shopName" TEXT,
    "price" INTEGER,
    "mileage" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Coating_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Wax" (
    "id" BIGSERIAL NOT NULL,
    "mycarId" BIGINT NOT NULL,
    "name" TEXT,
    "implementationDate" TIMESTAMP(3) NOT NULL,
    "shopName" TEXT,
    "price" INTEGER,
    "mileage" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Wax_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Wash" (
    "id" BIGSERIAL NOT NULL,
    "mycarId" BIGINT NOT NULL,
    "implementationDate" TIMESTAMP(3) NOT NULL,
    "shopName" TEXT,
    "price" INTEGER,
    "mileage" INTEGER,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Wash_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "Car" ADD CONSTRAINT "Car_makerId_fkey" FOREIGN KEY ("makerId") REFERENCES "Maker"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MyCar" ADD CONSTRAINT "MyCar_userId_fkey" FOREIGN KEY ("userId") REFERENCES "User"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MyCar" ADD CONSTRAINT "MyCar_mycarId_fkey" FOREIGN KEY ("mycarId") REFERENCES "Car"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MaintenanceItemActivation" ADD CONSTRAINT "MaintenanceItemActivation_mycarId_fkey" FOREIGN KEY ("mycarId") REFERENCES "MyCar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "NoticeFrequency" ADD CONSTRAINT "NoticeFrequency_mycarId_fkey" FOREIGN KEY ("mycarId") REFERENCES "MyCar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "EngineOil" ADD CONSTRAINT "EngineOil_mycarId_fkey" FOREIGN KEY ("mycarId") REFERENCES "MyCar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "OilFilter" ADD CONSTRAINT "OilFilter_mycarId_fkey" FOREIGN KEY ("mycarId") REFERENCES "MyCar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DifferentialGearOil" ADD CONSTRAINT "DifferentialGearOil_mycarId_fkey" FOREIGN KEY ("mycarId") REFERENCES "MyCar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "MtOil" ADD CONSTRAINT "MtOil_mycarId_fkey" FOREIGN KEY ("mycarId") REFERENCES "MyCar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BrakeFluid" ADD CONSTRAINT "BrakeFluid_mycarId_fkey" FOREIGN KEY ("mycarId") REFERENCES "MyCar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "BrakePad" ADD CONSTRAINT "BrakePad_mycarId_fkey" FOREIGN KEY ("mycarId") REFERENCES "MyCar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "DiskBrake" ADD CONSTRAINT "DiskBrake_mycarId_fkey" FOREIGN KEY ("mycarId") REFERENCES "MyCar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "LLC" ADD CONSTRAINT "LLC_mycarId_fkey" FOREIGN KEY ("mycarId") REFERENCES "MyCar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AirConditionerFilter" ADD CONSTRAINT "AirConditionerFilter_mycarId_fkey" FOREIGN KEY ("mycarId") REFERENCES "MyCar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AirConditionerGas" ADD CONSTRAINT "AirConditionerGas_mycarId_fkey" FOREIGN KEY ("mycarId") REFERENCES "MyCar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "AirCleaner" ADD CONSTRAINT "AirCleaner_mycarId_fkey" FOREIGN KEY ("mycarId") REFERENCES "MyCar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Tire" ADD CONSTRAINT "Tire_mycarId_fkey" FOREIGN KEY ("mycarId") REFERENCES "MyCar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "TirePressure" ADD CONSTRAINT "TirePressure_mycarId_fkey" FOREIGN KEY ("mycarId") REFERENCES "MyCar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Battery" ADD CONSTRAINT "Battery_mycarId_fkey" FOREIGN KEY ("mycarId") REFERENCES "MyCar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "PowerSteeringOil" ADD CONSTRAINT "PowerSteeringOil_mycarId_fkey" FOREIGN KEY ("mycarId") REFERENCES "MyCar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "SparkPlug" ADD CONSTRAINT "SparkPlug_mycarId_fkey" FOREIGN KEY ("mycarId") REFERENCES "MyCar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Coating" ADD CONSTRAINT "Coating_mycarId_fkey" FOREIGN KEY ("mycarId") REFERENCES "MyCar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Wax" ADD CONSTRAINT "Wax_mycarId_fkey" FOREIGN KEY ("mycarId") REFERENCES "MyCar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Wash" ADD CONSTRAINT "Wash_mycarId_fkey" FOREIGN KEY ("mycarId") REFERENCES "MyCar"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
