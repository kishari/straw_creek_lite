<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<?xsl-test-case type="text/xml" href=".\xml-1.xml"
      ?>
<xslt:stylesheet xmlns:date="http://exslt.org/dates-and-times" xmlns:str="http://exslt.org/strings" xmlns:xslt="http://www.w3.org/1999/XSL/Transform" xmlns:fo="http://www.w3.org/1999/XSL/Format" xmlns:xf="http://www.ecrion.com/xf/1.0" xmlns:xc="http://www.ecrion.com/2008/xc" xmlns:xfd="http://www.ecrion.com/xfd/1.0" xmlns:svg="http://www.w3.org/2000/svg" xmlns:msxsl="urn:schemas-microsoft-com:xslt" xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0" extension-element-prefixes="date str">
<xslt:output indent="yes" encoding="utf-8"/>
<!-- =========================== Variables ============================== -->
	<!-- Quote szintű adatok -->
	<!-- =================== -->
	<xsl:variable name="quoteNumber" select="/quote/quoteNumber"/>
	<xsl:variable name="policyNumber" select="/quote/policyNumber"/>
	<xsl:variable name="producerCode" select="/quote/producerCode"/>
	<xsl:variable name="dealerCode" select="/quote/dealerCode"/>	
	<xsl:variable name="policyReasonIsOwnerChanging" select="/quote/policyReasonIsOwnerChanging"/>
	<xsl:variable name="partnerNumber" select="/quote/partnerNumber"/>
	<xsl:variable name="warrantNumber" select="/quote/warrantNumber"/>	
	<xsl:variable name="antecedentPolicy.policyId" select="/quote/antecedentPolicy/policyId"/>
	<xsl:variable name="antecedentPolicy.insurantName" select="/quote/antecedentPolicy/insurantName"/>
	<xsl:variable name="antecedentPolicy.registrationNumber" select="/quote/antecedentPolicy/registrationNumber"/>
	<xsl:variable name="antecedentPolicy.bonusMalus" select="/quote/antecedentPolicy/bonusMalus"/>
	<xsl:variable name="antecedentPolicy.cessationReason" select="/quote/antecedentPolicy/cessationReason"/>
	<xsl:variable name="antecedentPolicy.dateOfCessation" select="/quote/antecedentPolicy/dateOfCessation"/>
	<xsl:variable name="antecedentPolicy.statementFromExistingLiabilityInsurance" select="/quote/antecedentPolicy/statementFromExistingLiabilityInsurance"/>
	<xsl:variable name="antecedentPolicy.statementFromMissingDamageEvent" select="/quote/antecedentPolicy/statementFromMissingDamageEvent"/>
	<xsl:variable name="paymentFrequency" select="/quote/paymentFrequency"/>
	<!-- Fizetési mód: 1: csoportos beszedés, 2: postai csekk, 3: banki átutalás  -->
	<!-- A tarifálóban csak ennyi van: 1: csoportos beszedés, 2: egyéb -->
	<xsl:variable name="paymentMethod" select="/quote/paymentMethod"/>
	<xsl:variable name="startDate" select="/quote/startDate"/>
	<xsl:variable name="endDate" select="/quote/endDate"/>
	<xsl:variable name="bonusMalus" select="/quote/bonusMalus"/>
	<xsl:variable name="dateOfQuote" select="/quote/dateOfQuote"/>
	<xsl:variable name="durationType" select="/quote/durationType"/>
	<xsl:variable name="result.baseTariff" select="/quote/result/baseTariff"/>
	<xsl:variable name="result.yearlyPremium" select="/quote/result/yearlyPremium"/>	
	<xsl:variable name="result.installmentPremium" select="/quote/result/installmentPremium"/>
	<xsl:variable name="result.totalPremium" select="/quote/result/totalPremium"/><!-- Határozott időtartamúnál használt mező -->
	<xsl:variable name="result.firstPremium" select="/quote/result/firstPremium"/>
	<xsl:variable name="result.mabiszPremium" select="/quote/result/mabiszPremium"/>
	<xsl:variable name="result.fractionalPeriodPremium" select="/quote/result/fractionalPeriodPremium"/>
	<xsl:variable name="result.totalMultiplier" select="/quote/result/totalMultiplier"/>
	<xsl:variable name="result.surchargeMultiplier" select="/quote/result/surchargeMultiplier"/>
	<xsl:variable name="result.discountMultiplier" select="/quote/result/discountMultiplier"/>
	<xsl:variable name="result.otherMultiplier" select="/quote/result/otherMultiplier"/>
	<xsl:variable name="mkbPartnerDiscountRef" select="/quote/mkbPartnerDiscountRef"/>
	<xsl:variable name="delayedPayment" select="/quote/delayedPayment"/>
	<xsl:variable name="delayedDays" select="/quote/delayedDays"/>
	<xsl:variable name="dateOfFirstPremium" select="/quote/dateOfFirstPremium"/>
	<xsl:variable name="startDateOfMABISZPremium" select="/quote/startDateOfMABISZPremium"/>
	
	<!-- Partner szintű adatok -->
	<!-- ===================== -->
	<xsl:variable name="partner.name" select="/quote/partner/name"/>
	<xsl:variable name="partner.genderCode" select="/quote/partner/genderCode"/>
	<xsl:variable name="partner.ownership" select="/quote/partner/ownership"/>
	<xsl:variable name="partner.phone" select="/quote/partner/phone"/>
	<xsl:variable name="partner.mobilePhone" select="/quote/partner/mobilePhone"/>
	<xsl:variable name="partner.email" select="/quote/partner/email"/>
	<xsl:variable name="partner.nationality" select="/quote/partner/nationality"/>
	<xsl:variable name="partner.dateOfBirth" select="/quote/partner/dateOfBirth"/>
	<xsl:variable name="partner.placeOfBirth" select="/quote/partner/placeOfBirth"/>	
	<xsl:variable name="partner.birthName" select="/quote/partner/birthName"/>
	<xsl:variable name="partner.mothersName" select="/quote/partner/mothersName"/>
	<xsl:variable name="partner.taxNumber" select="/quote/partner/taxNumber"/>
	<xsl:variable name="partner.tradeRegisterNumber" select="/quote/partner/tradeRegisterNumber"/>
	<xsl:variable name="partner.drivingLicenseNumber" select="/quote/partner/drivingLicenseNumber"/>
	<xsl:variable name="partner.yearOfDrivingLicense" select="/quote/partner/yearOfDrivingLicense"/>
	<xsl:variable name="partner.permanentAddress.postCode" select="/quote/partner/addresses/address[type='PERMANENT']/postCode"/> 
	<xsl:variable name="partner.permanentAddress.city" select="/quote/partner/addresses/address[type='PERMANENT']/city"/>
	<xsl:variable name="partner.permanentAddress.addressLine1" select="/quote/partner/addresses/address[type='PERMANENT']/addressLine1"/> 
	<xsl:variable name="partner.permanentAddress.addressLine2" select="/quote/partner/addresses/address[type='PERMANENT']/addressLine2"/>
	<xsl:variable name="partner.mailingAddress.postCode" select="/quote/partner/addresses/address[type='MAILING']/postCode"/> 
	<xsl:variable name="partner.mailingAddress.city" select="/quote/partner/addresses/address[type='MAILING']/city"/>
	<xsl:variable name="partner.mailingAddress.addressLine1" select="/quote/partner/addresses/address[type='MAILING']/addressLine1"/> 
	<xsl:variable name="partner.mailingAddress.addressLine2" select="/quote/partner/addresses/address[type='MAILING']/addressLine2"/>
	<xsl:variable name="partner.accountNumber" select="/quote/partner/accountNumber"/>
	<xsl:variable name="partner.bankName" select="/quote/partner/bankName"/>
	<xsl:variable name="partner.child.dateOfBirth" select="/quote/partner/child/dateOfBirth"/>
	<xsl:variable name="partner.child.name" select="/quote/partner/child/name"/>
	
	<!-- Jármű szintű adatok -->
	<!-- =================== -->
	<xsl:variable name="vehicle.typeCode" select="/quote/vehicle/typeCode"/>
	<xsl:variable name="vehicle.eurotaxCode" select="/quote/vehicle/eurotaxCode"/>
	<xsl:variable name="vehicle.make" select="/quote/vehicle/make"/>
	<xsl:variable name="vehicle.model" select="/quote/vehicle/model"/>
	<xsl:variable name="vehicle.modelType" select="/quote/vehicle/modelType"/>
	<xsl:variable name="vehicle.maximumNettoPower" select="/quote/vehicle/maximumNettoPower"/>
	<xsl:variable name="vehicle.cubicCapacity" select="/quote/vehicle/cubicCapacity"/>
	<xsl:variable name="vehicle.carDocumentsNumber" select="/quote/vehicle/carDocumentsNumber"/>
	<xsl:variable name="vehicle.underCarriageNumber" select="/quote/vehicle/underCarriageNumber"/>
	<xsl:variable name="vehicle.seatingCapacity" select="/quote/vehicle/seatingCapacity"/>
	<xsl:variable name="vehicle.yearOfProduction" select="/quote/vehicle/yearOfProduction"/>
	<xsl:variable name="vehicle.ownWeight" select="/quote/vehicle/ownWeight"/>
	<xsl:variable name="vehicle.maximumAllowedWeight" select="/quote/vehicle/maximumAllowedWeight"/>
	<xsl:variable name="vehicle.dateOfPurchase" select="/quote/vehicle/dateOfPurchase"/>
	<xsl:variable name="vehicle.operationalModality" select="/quote/vehicle/operationalModality"/>
	<xsl:variable name="vehicle.registrationNumber" select="/quote/vehicle/registrationNumber"/>
	
	
	<!-- Módosító paraméterek -->
	<!-- ==================== -->
	<xsl:variable name="discount.mkbbcasco" select="/quote/modfactors/modfactor[code='MKBB-CASCO']/value"/>
	<xsl:variable name="discount.nonmkbbcasco" select="/quote/modfactors/modfactor[code='NON-MKBB-CASCO']/value"/>
	<xsl:variable name="discount.marketingPartner" select="/quote/modfactors/modfactor[code='MARKETING-PARTNER']/value"/>
	<xsl:variable name="discount.child" select="/quote/modfactors/modfactor[code='CHILD']/value"/>
	<xsl:variable name="discount.mkbPartner" select="/quote/modfactors/modfactor[code='MKB-PARTNER']/value"/>
	<xsl:variable name="discount.paymentMethodSurcharge" select="/quote/modfactors/modfactor[code='PAYMENT-METHOD']/value"/>
	<xsl:variable name="discount.email" select="/quote/modfactors/modfactor[code='EMAIL']/value"/>
	<xsl:variable name="discount.extraClaimFree" select="/quote/modfactors/modfactor[code='EXTRA-CLAIM-FREE']/value"/>
	<xsl:variable name="discount.teacher" select="/quote/modfactors/modfactor[code='TEACHER']/value"/>
	<xsl:variable name="discount.governmentEmployee" select="/quote/modfactors/modfactor[code='GOVERNMENT-EMPLOYEE']/value"/>
	<xsl:variable name="discount.publicEmployee" select="/quote/modfactors/modfactor[code='PUBLIC-EMPLOYEE']/value"/>
	<xsl:variable name="discount.campaign" select="/quote/modfactors/modfactor[code='CAMPAIGN']/value"/>
	<xsl:variable name="discount.entrepreneur" select="/quote/modfactors/modfactor[code='ENTREPRENEUR']/value"/>
	<xsl:variable name="discount.gerHunCCMember" select="/quote/modfactors/modfactor[code='GER-HUN-CC-MEMBER']/value"/>
	
	<xsl:variable name="surcharge.operationalModality" select="/quote/modfactors/modfactor[code='OPERATIONAL-MODALITY']/value"/>
	
	<xsl:variable name="modfactor.bonusMalus" select="/quote/modfactors/modfactor[code='BONUS-MALUS']/value"/>
	<xsl:variable name="modfactor.paymentFrequency" select="/quote/modfactors/modfactor[code='PAYMENT-FREQUENCY']/value"/>
	<xsl:variable name="modfactor.cubicCapacity" select="/quote/modfactors/modfactor[code='CUBIC-CAPACITY']/value"/>
	<xsl:variable name="modfactor.partner.area" select="/quote/modfactors/modfactor[code='AREA']/value"/>
	<xsl:variable name="modfactor.partner.drivingLicense" select="/quote/modfactors/modfactor[code='DRIVING-LICENSE']/value"/>
	<xsl:variable name="modfactor.vehicle.makePower" select="/quote/modfactors/modfactor[code='MAKE-POWER']/value"/>
	<xsl:variable name="modfactor.vehicle.age" select="/quote/modfactors/modfactor[code='VEHICLE-AGE']/value"/>
	
	<!-- Adatkezelési hozzájárulások -->
	<xsl:variable name="declaration.privacy1" select="/quote/declarations/declaration[code='PRIVACY1']/value"/>	
	<!--<xsl:variable name="declaration.privacy2" select="/quote/declarations/declaration[code='PRIVACY2']/value"/>-->
	<xsl:variable name="declaration.privacy2a" select="substring(/quote/declarations/declaration[code='PRIVACY2']/value,1,1)"/>
	<xsl:variable name="declaration.privacy2b" select="substring(/quote/declarations/declaration[code='PRIVACY2']/value,2,1)"/>
	<xsl:variable name="declaration.privacy2c" select="substring(/quote/declarations/declaration[code='PRIVACY2']/value,3,1)"/>
	<xsl:variable name="declaration.privacy2d" select="substring(/quote/declarations/declaration[code='PRIVACY2']/value,4,1)"/>
	<xsl:variable name="declaration.privacy2e" select="substring(/quote/declarations/declaration[code='PRIVACY2']/value,5,1)"/>
	<xsl:variable name="declaration.privacy3" select="/quote/declarations/declaration[code='PRIVACY3']/value"/>
	<xsl:variable name="declaration.itemsChecked" select="/quote/declarations/declaration[code='ITEMS_CHECKED']/value"/>
	<xsl:variable name="declaration.conditions" select="/quote/declarations/declaration[code='CONDITIONS']/value"/>
	<xsl:variable name="declaration.customerReference" select="/quote/declarations/declaration[code='CUSTOMER_REFERENCE']/value"/>
	<xsl:variable name="declaration.telesale" select="/quote/declarations/declaration[code='TELESALE']/value"/>
	<xsl:variable name="declaration.serviceBefore14Days" select="/quote/declarations/declaration[code='SERVICE_BEFORE_14_DAYS']/value"/>
	<xsl:variable name="declaration.email" select="/quote/declarations/declaration[code='EMAIL']/value"/>
	
	<xsl:variable name="declaration.bonusmalus" select="/quote/declarations/declaration[code='BONUS_MALUS']/value"/>
	<xsl:variable name="bonusmalus.registrationNumber" select="/quote/partner/parallelRegNumber"/>
	<xsl:variable name="declaration.continuousMTPL" select="/quote/declarations/declaration[code='CONTINUOUS_MTPL']/value"/>
	<xsl:variable name="declaration.claimless" select="/quote/declarations/declaration[code='CLAIMLESS']/value"/>
	
    <!-- =========================== checkbox pictures ========================= -->
    <xsl:variable name="filledCheckbox">url(data:image/bmp;base64,Qk3+CAAAAAAAADYEAAAoAAAAJAAAACIAAAABAAgAAAAAAMgEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgAAAgAAAAICAAIAAAACAAIAAgIAAAMDAwADA3MAA8MqmAAAgQAAAIGAAACCAAAAgoAAAIMAAACDgAABAAAAAQCAAAEBAAABAYAAAQIAAAECgAABAwAAAQOAAAGAAAABgIAAAYEAAAGBgAABggAAAYKAAAGDAAABg4AAAgAAAAIAgAACAQAAAgGAAAICAAACAoAAAgMAAAIDgAACgAAAAoCAAAKBAAACgYAAAoIAAAKCgAACgwAAAoOAAAMAAAADAIAAAwEAAAMBgAADAgAAAwKAAAMDAAADA4AAA4AAAAOAgAADgQAAA4GAAAOCAAADgoAAA4MAAAODgAEAAAABAACAAQABAAEAAYABAAIAAQACgAEAAwABAAOAAQCAAAEAgIABAIEAAQCBgAEAggABAIKAAQCDAAEAg4ABAQAAAQEAgAEBAQABAQGAAQECAAEBAoABAQMAAQEDgAEBgAABAYCAAQGBAAEBgYABAYIAAQGCgAEBgwABAYOAAQIAAAECAIABAgEAAQIBgAECAgABAgKAAQIDAAECA4ABAoAAAQKAgAECgQABAoGAAQKCAAECgoABAoMAAQKDgAEDAAABAwCAAQMBAAEDAYABAwIAAQMCgAEDAwABAwOAAQOAAAEDgIABA4EAAQOBgAEDggABA4KAAQODAAEDg4ACAAAAAgAAgAIAAQACAAGAAgACAAIAAoACAAMAAgADgAIAgAACAICAAgCBAAIAgYACAIIAAgCCgAIAgwACAIOAAgEAAAIBAIACAQEAAgEBgAIBAgACAQKAAgEDAAIBA4ACAYAAAgGAgAIBgQACAYGAAgGCAAIBgoACAYMAAgGDgAICAAACAgCAAgIBAAICAYACAgIAAgICgAICAwACAgOAAgKAAAICgIACAoEAAgKBgAICggACAoKAAgKDAAICg4ACAwAAAgMAgAIDAQACAwGAAgMCAAIDAoACAwMAAgMDgAIDgAACA4CAAgOBAAIDgYACA4IAAgOCgAIDgwACA4OAAwAAAAMAAIADAAEAAwABgAMAAgADAAKAAwADAAMAA4ADAIAAAwCAgAMAgQADAIGAAwCCAAMAgoADAIMAAwCDgAMBAAADAQCAAwEBAAMBAYADAQIAAwECgAMBAwADAQOAAwGAAAMBgIADAYEAAwGBgAMBggADAYKAAwGDAAMBg4ADAgAAAwIAgAMCAQADAgGAAwICAAMCAoADAgMAAwIDgAMCgAADAoCAAwKBAAMCgYADAoIAAwKCgAMCgwADAoOAAwMAAAMDAIADAwEAAwMBgAMDAgADAwKAA8Pv/AKSgoACAgIAAAAD/AAD/AAAA//8A/wAAAP8A/wD//wAA////AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD///////////////a0amprB/b///b/////////////////AAD////////29v///7VqKTEpawj///b/////////////////AAD////////29v//CGpqKTExarT2//b/////////////////AAD////////29v8IczJycnJyMWsI////////////////////AAD//////////whzcnJycnJycjL39vb/////////////////AAD/////9vb/9mt7enNzcnJycnJrB///////////////////AAD/9vb29v//q3t7c3t7e3pzc3NypPb/////////////////AAD//////wise3t7e3t7cnt7e3J7a/f2////////////////AAD/////CKx7e3t7e3u0tHt7e3tzeqsI////////////////AAD///8Ic3t7e3x7e3sH9r17e3t7e3Os9v//////////////AAD//whzfHx8e3x8e7X2/wh8e3t7e3trB/b///b/////////AAD/CLR7fHx7e3t7tfb///+9e3t7e3tzrAj///b/////////AAD/CLN7e3t7e3P19v/2//8IvHt7e3t7c/f2////////////AAD/9ghze3t7cwj/////////CHt7vHt7e6sH////////////AAD///YIc3O0CP//////////9rx7vHx8e3Os9v//////////AAD/////9gj2////9v//9vb//wh7fHt7e3trB/b/////////AAD///////////////////////+1e3u8vHt6o/b///b2////AAD/////////////////////9v//tHt7fHy8cqz2////////AAD/////////////////////////CHt7e3x8fGIH9v/////2AAD///////////////////////b2/717e3t7e3ujB//////2AAD////////////////////////2/wi0e3t7e3tzrAj/////AAD///////////////////////b///8Ic3N7e3t7a/f2///2AAD/////////////////////////////vXNzc3N7e2sH///2AAD/////////////////////////////9rRzc3Nye3KsCP//AAD//////////////////////////////whzc3Nzc3Nr9/b/AAD///////////////////////////////8Hc3Jzc3tya/f2AAD/////////////////////////////9v//tHJzc3NzcqMHAAD/////////////////////////////////9mtyc3Nzc2qsAAD///////////////////////////////b//whqcnNzc3NqAAD///////////////////////////////b2//+9cnJycnJyAAD//////////////////////////////////////2pqamq0AAD//////////////////////////////////////7Vzc7UIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==)</xsl:variable>
    <xsl:variable name="blankCheckbox">url(data:image/bmp;base64,Q k3+CAAAAAAAADYEAAAoAAAAJAAAACIAAAABAAgAAAAAAMgEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAgAAAgAAAAICAAIAAAACAAIAAgIAAAMDAwADA3MAA8MqmAAAgQAAAIGAAACCAAAAgoAAAIMAAACDgAABAAAAAQCAAAEBAAABAYAAAQIAAAECgAABAwAAAQOAAAGAAAABgIAAAYEAAAGBgAABggAAAYKAAAGDAAABg4AAAgAAAAIAgAACAQAAAgGAAAICAAACAoAAAgMAAAIDgAACgAAAAoCAAAKBAAACgYAAAoIAAAKCgAACgwAAAoOAAAMAAAADAIAAAwEAAAMBgAADAgAAAwKAAAMDAAADA4AAA4AAAAOAgAADgQAAA4GAAAOCAAADgoAAA4MAAAODgAEAAAABAACAAQABAAEAAYABAAIAAQACgAEAAwABAAOAAQCAAAEAgIABAIEAAQCBgAEAggABAIKAAQCDAAEAg4ABAQ AAAQEAgAEBAQABAQGAAQECAAEBAoABAQMAAQEDgAEBgAABAYCAAQGBAAEBgYABAYIAAQGCgAEBgwABAYOAAQIAAAECAIABAgEAAQIBgAECAgABAgKAAQIDAAECA4ABAoAAAQKAgAECgQABAoGAAQKCAAECgoABAoMAAQKDgAEDAAABAwCAAQMBAAEDAYABAwIAAQMCgAEDAwABAwOAAQOAAAEDgIABA4EAAQOBgAEDggABA4KAAQODAAEDg4ACAAAAAgAAgAIAAQACAAGAAgACAAIAAoACAAMAAgADgAIAgAACAICAAgCBAAIAgYACAIIAAgCCgAIAgwACAIOAAgEAAAIBAIACAQEAAgEBgAIBAgACAQKAAgEDAAIBA4ACAYAAAgGAgAIBgQACAYGAAgGCAAIBgoACAYMAAgGDgAICAAACAgCAAgIBAAICAYACAgIAAgICgAICAwACAgOAAgKAAAICgIACAoEAAgKBgAICggACAoKAAg KDAAICg4ACAwAAAgMAgAIDAQACAwGAAgMCAAIDAoACAwMAAgMDgAIDgAACA4CAAgOBAAIDgYACA4IAAgOCgAIDgwACA4OAAwAAAAMAAIADAAEAAwABgAMAAgADAAKAAwADAAMAA4ADAIAAAwCAgAMAgQADAIGAAwCCAAMAgoADAIMAAwCDgAMBAAADAQCAAwEBAAMBAYADAQIAAwECgAMBAwADAQOAAwGAAAMBgIADAYEAAwGBgAMBggADAYKAAwGDAAMBg4ADAgAAAwIAgAMCAQADAgGAAwICAAMCAoADAgMAAwIDgAMCgAADAoCAAwKBAAMCgYADAoIAAwKCgAMCgwADAoOAAwMAAAMDAIADAwEAAwMBgAMDAgADAwKAA8Pv/AKSgoACAgIAAAAD/AAD/AAAA//8A/wAAAP8A/wD//wAA////AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAD////////29v/// /////////////b/////////////////AAD///////////////////////////b/////////////////AAD/////////////////////////////////////////////AAD/////////////////////////////////////////////AAD/////////////////////////////////////////////AAD/9v//////////////////////////////////////////AAD/////////////////////////////////////////////AAD/////////////////////////////////////////////AAD/////////////////////////////////////////////AAD///////////////////////////////////b/////////AAD////////////////////////////////// /b/////////AAD////////////////2////////////////////////////AAD/////////////////////////////////////////////AAD/////////////////////////////////////////////AAD/////////////9v//9vb/////////////////////////AAD///////////////////////////////////////b2////AAD/////////////////////9v//////////////////////AAD////////////////////////////////////////////2AAD///////////////////////b////////////////////2AAD////////////////////////2////////////////////AAD///////////////////////b////////////////////2AAD////// //////////////////////////////////////2AAD/////////////////////////////////////////////AAD/////////////////////////////////////////////AAD/////////////////////////////////////////////AAD/////////////////////////////9v//////////////AAD/////////////////////////////////////////////AAD///////////////////////////////b/////////////AAD///////////////////////////////b2////////////AAD/////////////////////////////////////////////AAD/////////////////////////////////////////////AAD////////////////////////// ///////////////////AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA==)</xsl:variable>
	<xsl:variable name="mkbLogo">url(data:image/bmp;base64,iVBORw0KGgoAAAANSUhEUgAAAXIAAADcCAYAAABtRSojAAAAAXNSR0IArs4c6QAAAAZiS0dEAP8A/wD/oL2nkwAAAAlwSFlzAAALEwAACxMBAJqcGAAAAAd0SU1FB9oKFBQlKVvUDqcAABflSURBVHja7Z3tdds4FoYvfPZ/tBWEW0GUCkJXEKWCyBXErsByBXYqkFKBnQqsVCClAnMqsKYC7A/BJ05iWqR48UU8zzl7ZnZmQpH4ePHi4gIQAQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABQxlo7tdbe27x4tNZeW2snhZfDE9e05PgYigAiifhcRJYZf8LaGHOqUA6ViGxEZJJpOeyMMf+lRcflhCKACCJeZS7iIiK1tXaq8Jx5xiIumb87Qg4wgGok36EhYm9pDoCQQ45sRWRHMYiIyE+KABByyA5jzE5ELjL/jJ0bkIayUnpOzEEZEHIoVMxXInKW8SdcuAFJY1A7FZG7TMvhO60ZoHCstZW1dplRut2DtXbmqSxqVxaPGZTDra9ygCMMAUUAiQj6RERmIvJORKayX0icRn6tO9nHsNeyT7PbRiiPj+6vMUMn310ZSOhyAIARiLu1du5ccEjHfa654SfTWcu9tbamFQKApqCHELLrlAT8hXKYWms3AXauntPqAMCXkPncxj7PaFDbeJyNTGlpAOA7xOCDRYYzFG0x36Q8GwGAcYm5toA9ZFoOtWIZLBFxAAgpYIsSQyoeB7UlrSp/2BAEubFWfl6TcVkM3YyzMsac0aQQcoDQcEaLDog4Qg4QBw+bUXJ25MeenLiV/M+6gef9giKA3LDWWsWBwWRcDg/S/0jgrYicapwTAzhyABgm4vURIr5DxBFyAEiHS0QcAHJ2o2pk+v2zIz6VkwoBACFP5NsnRxxzu6DVAABCns6337LhBwAQ8kyF/IiQCuenFALph5ClkKt1gEzSD50gb6R7psrT4iaXQBTAfygCgCy4lH7phmdjE/EjL7oo4kYjHDngyPMQsPsef+TGGHORSV0+XelXuf+9fTZgPV35p8lO9puinv7+p+x39zbGmDVCDoCQ+xK6PiGVrTHmfaLfUjlxnorIB09CPZS1iPwQkbucnLxJoGLnf/zjN+Lv0t2diHw3xqxGImjVEVPuPjTOsdwZYxqEPMq3XovIeY/2/T6xunq6QLr22E7FY/v/5mY4bKRqE6Ej8mHVDtIfQfnNA5bXY0rndpeSteLu6Mxu04/LrllG7N9eNMMZJ/ijspeRK+Y680EwBhVCHvQ7N7m0Z7dR6dzd+zlWHlPdXBXzrJXYonCe8Qh7Gel3v2BBggnjokeIcSsiVzFnhyLyICLXGYZP+jARkUs3wCZ1SXXM9MPvLm4Wky+S57nM08J+tzQRn/YcrM9ixHDdey4TaBdb2S9SPmWgPG+vb91fa+V+cG+tvRjLetvQqdgm8lTpIdNyi8UtoZXkQirnkd5xnkAM/LarM3b9xkfsfiGl4xZzYsfUJpmVWR2pnO5TmU6OWchdnLlznUR6xypyn30csrDrRP16TMkTUXd2GmO21tr3sk+v+iJxckqnon+hr098h6MaN1X9+fz/s9U7jED2CKnsRORTpFetIhbT4KMHXBjqwlr704WGhjK31v5jjMGdu1FyEWG6Ns+snO49Ou46kzIYpSPvWbezyH31IZITnyp/y7xULQkxbQuZmrjMrHwogxEKec+Qym0C7ztxIrhwsep7jybDa4ql+4YkBxoEvcdRnxmVydTD9+e44DsqIe95WcRj6us6ru/OPbj2hcd3vs9ZT5K9s9MY0xhjzkTkvfiNYU8zWvD0Efr4hm2IzlK6rw99Sn27uOu7K2PM/ySf9F6t95zGyGRJ/vJlY8zWGHMqIjc+xTyTxvYBzRvdzHMmIl3j3Te5ndBnjLkRkbscdEZEVkqP+xJ6s+FJRm3i38ycbskDDnQMqUj3rIlGIu7eHMjXTN5Tq3wnEnj39QndKQ+n60b4iqoaFX1CKme5nsCXyyzCnRqp9a7zkK4cIc/H6eLGx+XGaxlxSCVjNNeMgrlyhNxNhTI4QIv4+HhEvE9IZSf5hlRynD2sXJlrufIgiRQI+S9q3g8C0ecykDMuNQiO5uLsHCEPy7vE34/QyjjceC3db/y5M8bcUWrB+aH4rM8IOY73eeeH/EW8b0jljFKLwlrTgIUI2yLkeThehHwcnAshleRx2SuN4iO9n4uTk5C/Kdj5stCZvxvvc1nEmpDKqFz5R4Q8rGOeFvzt4BdCKnnxM6cZNaGVxJ2vc3I+U5jeUO3e63DRYzC+clN7iMtWuQ14FXOEPH3nWxf4zWMS8T4hla07mwRGJuS++xlC/jtVghuDiI/nTZ8ztAmpJIKHhea3CPlh1oojaGoOdfrKN0Pabvy8x4zqhuv0ktQVHHnA0fNUFM8TTkgIKnk5XW3nvrmhryUr4pV0D6k0wjb80c/2EfJuYq41eqYUymhzc9tnAgBp0udkwwtyxpNEs38h5IGnQnVC39N2bMAP+ljSbnzeox2RM54u/+TyomMT8q1SR0wlvFJ7HLDAj4hPpPsCJznjZbUNbyYxJyGfdBA1LadaJyIILw4onE2dNH1CKl/JGYfShLyLS9Za9X+X8PeS2ZCu4+pz/2ZjjFlQalCakB9E8bCbOoHPqTvMQCAdEe9zsqEIIZUS8Tb7GuOGIA3HWoW62eMV2rJnftIfkuRauodU7giPlYfPMNoYhVwrTh57wRNHno8br6X7TTA70dvzAIAjP1JIQwhD2yCy8zCq13SDQXXVN6TCAmeZeF3bGp2Qj2RjEG48H/rcv8kCZ7l43fA11kOzNAQvZmilbRBhI1BabryW7vdvirDAmRuaZg5HHqnQJhE3BnVNPSQVMS59QioscJaN112iYxDyl6YsWpkdwYX8lYOyXgob/Uv/iObGF9Lv/AwWOPOjUnwWjvxAKuBLoq3lfGJsDKpb/jluLp322OeyCBFu/SleyH3PxnJx5NOehdaIzuJCHeFb38UY0aEXfUIqjYhw60+eg7UW3k3YmG8I0ii8GDHytsGDhc40OviiZ7u44ojast14iL47ZiH/qdRxg7ny1w7KEkIrKYh4Jf1CKmtjzIqSyxJNE+f9mGIc+fEOOaQbb3B1SdAnpLITkU8UWbZopR42Ia7wG62QKy4uhFzwxI2n68b73L8psk83ZPDFkQe5NORk5JWxTahCh7gADsqKK+KV9AupiLCmkXN9T6X7AWiH+IqQD0fDyVauI4egjuHIQ64DZMryiI7dUGzZotUf1qHSTscu5NlsDHpFTHchYmzQWi/zIzv2hNLLls9Kz7kK9cJj3dmp7WRDHKDFjUDpiXif+zeDD/7gpc4rpbpbhzySYQxC3ip0ihuDQnTKYw7KWtP1vHJMSCXk4A/6zJSecxXypXMR8nrAn11H/v2hv4FYx3Fms4Gdug64tgJ6fFF4RvAD0k4KqBitjUHeXLnr8JO+Mw7wVh99L4toY05pZlXvcxm+ozPKDVAlCLnWyOjTlbc9e0suchQuRWex8gtFmdXgfanwqIsYB6SNXsgz2Rj0wfMgBN07dC39Lot4jYlzeZDH4D3Uja9iHclwUkglaYQnfDrytrANG4HCu7Kl8mM/U7LJ1/tMYfDeGmOi3QBVipBrONvqwLnoQ8SDrfnjcWV/GYCIN03B4f43VRi8tyJyGvM7ShHylDcGtTn9HZcRBO3QteiFVP6EWHm6In4vw9ZDtiJyGnstC0euI7pDID6eBtcenz33MZuDQSI+F5HNQBFfpyDixQi54sYgH5s82lx+yEOX6sI79UL8b/qaI59J1HVlrb2V4eGUG2PMaSpZZWMQ8q7hBw2HGzK0Qv54uOn1ZYCfIrwSX8CXIvIgwzZ6Nc6FJ3WZdi5C/uGA2+6CRpx8orlb77VTBzumTZJjPpxloN+pXHYEBBykrbXn1tqNE/Ahs6Kd7Lfdvw+9a7ML/ymoXtdKzqsWkZVnN96poRhjttZaemx6s6w2PkugiwZGyqW19vJZ//gz/PjG1edEsV53sj9T/CblzXnFCLkxZq0kepobg9qexaUE42Rmra3IRlIzQLXH37gTke+SyU1PJ4U1gNQ2BtUe3xPShFh52vpwavZ8MsascjkiozQhX6cyFT9wndSaPjVaSEVMl12K8W+E/G+0TkLUcOVtA0LDQVmjZiJ6Z16DLrX9xb21dmmtzWLgxZHHc+VsBEqfK9lvvdZeoCS8koGoyz7LZSkij9ba25SzjooS8sQ2BrW5ehY60+DCGLNwU+0z0b1MecqF19kxE5Fba+1DiidanhRYIRqOd5Ajd7noVcu/ZqEzPitjzM0zA7ATkW/Kv8GpiHlSicjShV6SOQytRCHXiJMPPQmxrQHsjDExhPwt/fPXQNpyHOlK+XdY9DyenezDXVci8kn24a//mQO4/+5M9K5/3LjjHaCjg23j8Yhn1VaH2YDvuW555q1i2fThfiTtYSiPr+3cdYtfmizow73YaIU1nA7cK75X1EE5d0fe270qphcNmVbVHmcLcDxXBzbrEF6Jy3etG3iMMWtjzKno3K85FZGHmKGWk0IbhEb44sPAin+JYwaZhv6tFlK56WACNENfFVfBxcXV+akMT4KYiEi0uHmpQq7hyutjp3TKswWEXIeuzuwrrnx0Yr7OXcxLFXKtjUHHVFjtcXCBIwf2roOom9prbtiqNU/UhKPFXOu6tihijiMfxjGV1RaSIe0wHn1j39qu/JIqSEbMNS5Qnsg+5zzYAuhJoRXWSLyNQSncCAS/2B2xgLZSfocZqYjJaMNKqX4rEbkN9d4nBdeZhgPu5cgPHJSFI4/D3RGdvVEWc85fSYsL0Vl7qkOlmJYs5BoOuG9opW755w1nVEfj+5F/TjsVkfBKOq58JzppiSL7yzC8x8tLFvK1xkN6npnBQVnpsTuys69FPxWxpjqSEfM7xX7p/TrB5IXc42im1Qn7dL62b2EjUJ5oL3pyKmJaXCk9Z+o7xJKDI/eyCOSmTxpi3unqtwMHZcV25DjB49rQSnRTEWekIiZVv2vFvvnFZ93mHloZ2olCLni2iWWsg7IgTVc+p0hH6con4nEdJHchHxqS0FjwrDqOtO88DiYQj5Xy8wivpOfKG61B2pcrPym8nrREtIsrrz0NJgwEcTt6I7o3CE04f2XUsy4vrvyk8E64FZ0Y56tC7jZ7aB6U9Zx/6Wej6ui48vTQHKi9bP46oY6CnIQ4PTB1A6bfv7WXlG6foX5NozjznYiHdRCEXCdOXh/57wmLjIcr5efhytPiW8p1i5DrbQyaHuHYcePjmn5rpiJyFdwIdcJRac+4EPIwC561x9kApDH93omHez0p2WTqV2s97QnVc+hzEPJpgA7obWPQgW3XhFbGBYueuPKuqB6SVuzOTg+CWvcciDgoa3yurRHdDIdqyCXfoM4P5bpVM6mEVvQqqK1SsoiPc2ATrhyCGL4u5g8hj1lBLWLYVlkclDVOV74W3VREroIbr5B/0HoQQi7+Nga5DjjJwZGDKqQijlMndtqDNEKe5mj7rmNFcVDWuCEVcbxoCvlEa7aFkP/CR5w8xEXLOPs0ndtKs8MLV8GNyfC9phlFCvk6sWdN/3BOXLRcLix6jhPts40Q8kRH2pmI94OyIH1X3ohuKuKUzKJROvK3CLn+dFijkp52bJ2/8lsIOa58SNuCeOyUn1eVIuRvA/6WysYga+3tK1NhFjnLMQdr0V0cm5OKODqKEfKQDVcrdj0T0g7BjyufU6RR0TZixQh5zpXkc7DIecAsiZUkfNgS9J5l7VJ8L4T890rSPuEs1mCBkKfV8bXPX8GVA0IeUWg5KKtMtHd64soBIT+Az9DHmuIt0pU3ynXP+SuAkEcUWw7KKhftRc9LihQQ8nZ8hlZw5OW68jvRTUWccf4KIOTtHU5rY9CfeDkoi81FxbpyL7exA0KOK8eNw+usRDcrivNXIBshryL8po8FT+LjejQZz/a0UxFrmgMg5DhyhDwsXDoB6m2Z0MrLzkl9Y1AGsey31HyQttUoD+ozUhHD4WGBGSHPyJXn4MYRg3BwVnm+TJWfp2IYEfJ2fiT6LMjflWunIs4p1WxRWTtDyMM4co6uBZ+ufML5K9k6cpUBHSFvZ53os2AcrIRUxBzRjpGrmDyEvH36u1MaLbepHn0J0duX9lVwU0rWO++U2wFCnokrJ6wCbbDomR9Vam4cIT+MxkJEiIVOHH+ernwrumG3OeeveEdz1qNW90kLeQL5seuUKgvXP0q+KT/vnCL1pke18iPVTF7qjjyqkCvEr3K6SKKiq0ZpYyvRTUXk0ok83Hg5jjwR1ilUFEKOK+9aj9baGUXqhQ+as2jNJAiE3O/0h4OyoAs3ys9j0dMPdYpuHCHvOHIW4sghEs6ZrTQFh/NXdHGzHM2FZNW1EYTcnxh7uUgCRgupiGnzUfFZjbY2IOTd3FKDGwfP7YxUxLTRXHfQzlRCyD2KMvFxiNnBJ8riUyzuHBvNQXGFkMfhGFHGkUNfV74S3VTES0pVBc2UzjsfKckIuSdRzvFSZM7qGJ0r5yq44X2iFt1sla8+3jN1IT80nQkiPEcsTOTqxompxkc7FZENQunMata+DF7qQn5IqEMKT58KCH2RREN/GwceUhHnI0pFfBPYjc+U3fiVr3fNPbQS8p7JPuIc2pH/gwSOCu3p93wk5RJs8dZl/Fzn4MZzEPJDQh3SaXQOr+QYH3fUAim4cu1UxLGEV0LG/K+V9eXK58umLuSHKi3k4txa+b8rfYYDr6O96DkWV+59UHJlpVleN77NXbJC7uJ6h0bESahMix4bg3LezYkjT8eVr0T3nPnPEfuyZh/1GvN377pUfGTj242n7si7joghxafLqPpD8oV0tbTQjJXXEdNLtWPbSx8v6crnXvmxZyGuekxSyN1CQ9ezIkI6jS4bg9YRikyzDDijIx1Wys/7knhf7jMonSu/Z+1EXDMT7irj9TKVQr21/agDvdf0wHtsIpTV0uozS7x93Ct+a534t2rW72Po81eO6Mt9mCu948LDuy2lZKy18yMKbROqgR54j+uA5TTx2EkeU97lWZiQ18p1ex7w3ZfWP/MB7zdVbkvB9SjJcMrAit+EcJIHKn4WoIxmrpwePXeQx5CdHiF/9Xs3it/7EGjw2dhw3PZZAHXv52uQiSLiJnIDrWSfmfJR9oub2gWwln0WyXetWJW1diHt23b/q7Ww4RrDVPaLue/c31cRqqlx5fhT9psatikIuegtcp+mHsd0rlNzqv7JGHPnIcZcu74cazZ3JyLfZX+N2va583Z954PsF1599aO1K9udjB3nKhfW2gcblo1GuMA54pe4VyyjWQDHfSz3scMupTly982a7eFW2X0/WIgaE4+RtXLrHG1odzkVkXuFHNQ296aZdvhZ0j3AqnblyEmJYdFMRZxp5GK7Z9xK2Rd372SfYnhWmpDHdECDU6Fe2RikOT1P/UKAievAEI6V8vO+KLXTkk/MXIvIe7d5KyolnkdeKVXgb6NygfmiJbuw4LjLCDQFY640oJdI41z4qY9LInIR8tgfrhEC+enRjadQRpAmqlfBKeRh7wor/0ZELlJx4b8N9KF/0MVWY8XVtrLPUtgN/IZKRDbOkezcM7eKZbSQ/gfaDx1M6p7leBFrFlJa1sof374RvayQrTHm/cB+8CDj505Evmln+mQt5H80gpBivlMW26f3b3xMr9yAN5P9YfrTZw7op3MGjQ8Bcr/7lPo4aen8URt04UI+F91UxEHf797nWsYVZlk7s/JD9im3yc88jABkhrKQn6U2Te7w/Y+KwrnSyLh4ZgByZZfCHgmAooRcMf93keH3a58Nwl2tmXNCEQBkh/YM4pwiRcgBICBuTUZzneIzpYqQA0B4NHcSV6kfXQwIOcAYWSs/jwtFEHIACInLsNBMi6t93oUJCDkAvIx2utwlRYqQA0BYtC/6nuPKEXIACIuPHYe4coQcIAhsYNnjYyfiPJfLNgAhh0xxU3/NSy3eUKp/sWS3J0IO4JO58vPIn/6bSvYHYQFCDqDuxgff8PSSaBFKeHnAVDivHBBygL84Fz/x8VwX+CrPz18i5gg5gKYbr8Tf7sM6U8F6F+A3EHMAUBPyjfXLoztTO6cyebDhIGYOAIMEaxlIrLIRc2vtuQ3PJrfBDgASCKcEcOIvifk88XKp3XvGYskO0LTgqjdITqRkv6D5UfRTDftwJ/sLppsEyuT5Haqxy+U5axH5Jvt7XLkmDQAAAAAAAAAAAAAAgvN/fShtIl7ybD0AAAAASUVORK5CYII=)</xsl:variable>
    <!-- =========================== Variables =========================== -->
    <xsl:variable name="mkbbRed">rgb(190,23,31)</xsl:variable>
    <xsl:variable name="tableCellBackGround">rgb(224,224,224)</xsl:variable>
	<xsl:variable name="quoteNumberTableHeight">14pt</xsl:variable>
	<xsl:variable name="firstPageTableRowHeight">14pt</xsl:variable>
	<xsl:variable name="secondPageTableRowHeight">12.8pt</xsl:variable>
	<xsl:variable name="thirdPageTableRowHeight">13pt</xsl:variable>
	
<!-- ============================ RAW XSL =============================== -->
<!-- =========================== SCRIPTS ================================ -->
<!-- ========================= ROOT TEMPLATE =========================== -->
<xsl:template match="/">
<fo:root>
      <fo:layout-master-set>
		<fo:simple-page-master master-name="A4Page" page-width="595.000pt" page-height="842.000pt">
			<fo:region-body region-name="xsl-region-body" margin="50.400pt"/>
			<fo:region-before region-name="xsl-region-before" display-align="after" extent="50.400pt"/>
			<fo:region-after region-name="xsl-region-after" display-align="before" extent="50.400pt"/>
			<fo:region-start region-name="xsl-region-start" extent="50.400pt"/>
			<fo:region-end region-name="xsl-region-end" extent="50.400pt"/>
		</fo:simple-page-master>
      	<fo:simple-page-master master-name="FirstPage" page-width="595.000pt" page-height="842.000pt">
      	<fo:region-body region-name="xsl-region-body" margin="50.400pt"/>
      		<fo:region-before region-name="xsl-region-before" display-align="after" extent="0pt"/>
      	<fo:region-after region-name="xsl-region-after" display-align="before" extent="50.400pt"/>
      	<fo:region-start region-name="xsl-region-start" extent="0pt"/>
      	<fo:region-end region-name="xsl-region-end" extent="0pt"/>
      	</fo:simple-page-master>
      </fo:layout-master-set>
      <fo:page-sequence master-reference="FirstPage">
		<fo:static-content flow-name="xsl-region-before" font-size="12pt" font-family="Arial">
			<fo:block>
				<fo:table table-layout="fixed" border-collapse="collapse">
					<fo:table-column column-width="proportional-column-width(50.000)" column-number="1"/>
					<fo:table-column column-width="proportional-column-width(50.000)" column-number="2"/>
					<fo:table-body>
						<fo:table-row>
							<fo:table-cell border-bottom-style="solid" background-color="{$mkbbRed}" padding-top="20pt" border-color="rgb(255,255,255)">
								<fo:block-container z-index="1" position="absolute" left="46.000pt" top="24.000px" width="60.000px" height="40.000px" overflow="hidden">
									<fo:block>
										<fo:external-graphic src="{$mkbLogo}" content-width="53.000px">																		
										</fo:external-graphic>
									</fo:block>
								</fo:block-container>
							</fo:table-cell>
							<fo:table-cell border-bottom-style="solid" font-size="7pt" background-color="{$mkbbRed}" padding-top="10pt" padding-bottom="3pt" padding-left="160pt" color="rgb(255,255,255)" text-align="left" border-color="rgb(255,255,255)">
								<fo:block font-size="6pt">
									<fo:block font-weight="bold">MKB Általános Biztosító Zrt.</fo:block>
									<fo:block>1133 Budapest, Váci út 76.</fo:block>
									<fo:block>Telefon: (1) 886 6900</fo:block>
									<fo:block>Fax: (1) 886 6909</fo:block>
									<fo:block>E-mail: info@mkbb.hu</fo:block>
									<fo:block>www.mkbb.hu</fo:block>
									<fo:block> </fo:block>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>  
						<fo:table-row>
							<fo:table-cell font-weight="bold" display-align="center" border-style="none" background-color="rgb(38,38,38)" padding-bottom="2pt" padding-top="4pt" padding-left="50.400pt" text-align="left" font-size="6pt">
								<fo:block color="rgb(255,255,255)">B I Z T O S Í T Ó</fo:block>
							</fo:table-cell>
							<fo:table-cell border-style="none" background-color="rgb(38,38,38)">
								<fo:block> </fo:block>
							</fo:table-cell>
						</fo:table-row> 
					</fo:table-body>
				</fo:table> 
			</fo:block>
		</fo:static-content>
		<fo:static-content flow-name="xsl-region-after" font-size="12pt" font-family="Arial">
			<fo:block text-align="center">
			<!--	<fo:page-number/> -->
			</fo:block>
		</fo:static-content>
		<fo:static-content flow-name="xsl-region-start" font-size="12pt" font-family="Arial">
			<fo:block>
			</fo:block>
		</fo:static-content>
		<fo:static-content flow-name="xsl-region-end" font-size="12pt" font-family="Arial">
			<fo:block> </fo:block>
		</fo:static-content>
		<fo:flow flow-name="xsl-region-body" font-family="Arial" font-size="8pt">
		      <fo:block font-weight="bold" display-align="auto" text-align="center" font-size="14" padding-top="40pt" color="{$mkbbRed}">KÖTELEZŐ GÉPJÁRMŰ-FELELŐSSÉGBIZTOSÍTÁS AJÁNLAT</fo:block>
		      <fo:block font-weight="bold" display-align="auto" text-align="center" font-size="12" color="rgb(0,0,0)">Az MKB Általános Biztosító Zrt. részére</fo:block>
		      <fo:block font-weight="normal" display-align="auto">
		            <!-- ================================== -->
		            <!-- Ajánlatszám táblázat --> 
		            <fo:table table-layout="fixed" border-collapse="collapse">
		                  <fo:table-column column-width="proportional-column-width(50.000)" column-number="1"/>
		                  <fo:table-column column-width="proportional-column-width(16.000)" column-number="2"/>
		                  <fo:table-column column-width="proportional-column-width(34.000)" column-number="3"/>
		                  <fo:table-body>
		                        <fo:table-row height="{$quoteNumberTableHeight}">
		                              <fo:table-cell border-style="none">
		                                    <fo:block> </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell display-align="center" border-width="thin" border-right-style="none" border-style="solid" background-color="{$tableCellBackGround}" padding="2pt" color="rgb(0,0,0)" text-align="left">
		                                    <fo:block>Ajánlatszám:</fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell font-weight="bold" display-align="center" border-width="thin" border-left-style="none" border-style="solid" padding="2pt" padding-left="10pt" text-align="left">
		                                    <fo:block>
		                                          <fo:inline>
		                                                <xsl:value-of select="$quoteNumber"/>
		                                          </fo:inline>
		                                    </fo:block>
		                              </fo:table-cell>
		                        </fo:table-row>                                
		                  </fo:table-body>
		            </fo:table>
		      </fo:block>
		      <fo:block font-weight="normal" display-align="auto"> </fo:block>
			  <fo:block font-weight="normal" display-align="auto"> </fo:block>
		      <!-- ======================= -->
		      <!-- Szerződésszám táblázat -->				      
		      <fo:table table-layout="fixed" border-collapse="collapse">
		            <fo:table-column column-width="proportional-column-width(16.000)" column-number="1"/>
		            <fo:table-column column-width="proportional-column-width(34.000)" column-number="2"/>
		            <fo:table-column column-width="proportional-column-width(16.000)" column-number="3"/>
		            <fo:table-column column-width="proportional-column-width(34.000)" column-number="4"/>
		            <fo:table-body>
		            	<fo:table-row display-align="center" height="{$firstPageTableRowHeight}">
		                        <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		                              <fo:block>
		                                    Szerződésszám:
		                              </fo:block>
		                        </fo:table-cell>
		                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
		                              <fo:block>
		                                    <fo:inline>
		                                          <xsl:value-of select="$policyNumber"/>
		                                    </fo:inline>
		                              </fo:block>
		                        </fo:table-cell> 
		                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		                              <fo:block>
		                                    Üzletszerző kódja:
		                              </fo:block>
		                        </fo:table-cell>
		                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
		                        	<fo:block> 	
		                        		<fo:inline>
		                        			<xsl:value-of select="$producerCode"/>
		                        		</fo:inline>
		                        	</fo:block>
		                        </fo:table-cell>
		                  </fo:table-row>
		            	  <fo:table-row display-align="center" height="{$firstPageTableRowHeight}">
		                        <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		                              <fo:block>
		                                    Partnerszám:
		                              </fo:block>
		                        </fo:table-cell>
		                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
		                              <fo:block>
		                              	<fo:inline>
		                              		<xsl:value-of select="$partnerNumber"/>
		                              	</fo:inline>
		                              </fo:block>
		                        </fo:table-cell> 
		                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		                              <fo:block>
		                                    Dealer kód:
		                              </fo:block>
		                        </fo:table-cell>
		                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
		                              <fo:block>
		                              	<fo:inline>
		                              		<xsl:value-of select="$dealerCode"/>
		                              	</fo:inline>
		                              </fo:block>
		                        </fo:table-cell>
		                  </fo:table-row>
		            </fo:table-body>
		      </fo:table>
			<fo:block font-weight="normal" display-align="auto"> </fo:block>
			<fo:block font-weight="normal" display-align="auto"> </fo:block>
		      <fo:block font-weight="normal">
			<!-- ================================== -->
			<!-- 1. Szerződő adatai táblázat 1. sor -->			      
                        <fo:table table-layout="fixed" border-collapse="collapse">
                              <fo:table-column column-width="proportional-column-width(100.000)" column-number="1"/>
                              <fo:table-body>
                              		<fo:table-row height="{$firstPageTableRowHeight}">
                                          <fo:table-cell display-align="center" border-width="thin" border-style="none" background-color="{$mkbbRed}" padding="2pt" color="rgb(255,255,255)" text-align="center">
                                              <fo:block>1. SZERZŐDŐ ADATAI</fo:block>
                                         </fo:table-cell>
                                    </fo:table-row>                                
                              </fo:table-body>
                        </fo:table>
		     <!-- ================================== -->
	           <!-- 1. Szerződő adatai táblázat 2. sor -->
			      <fo:table table-layout="fixed" border-collapse="collapse">
			            <fo:table-column column-width="proportional-column-width(50.000)" column-number="1"/>
			            <fo:table-column column-width="proportional-column-width(50.000)" column-number="2"/>
			            <fo:table-body>
			            	<fo:table-row display-align="center" height="{$firstPageTableRowHeight}">
			                        <fo:table-cell border-width="thin" border-style="solid" border-top-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-right="20pt" text-align="right" background-color="transparent">
			                              <fo:block>
			                                    <fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
			                                          <xslt:attribute name="xf:compat-id">id1837858
			                                                <xslt:value-of select="generate-id(.)"/>
			                                          </xslt:attribute>
			                                          <xsl:choose>
			                                                <xsl:when test="$partner.genderCode!=3">
			                                                      <xsl:attribute name="src">
			                                                            <xslt:value-of select="$filledCheckbox"/>
			                                                      </xsl:attribute>
			                                                </xsl:when>
			                                          </xsl:choose>
			                                    </fo:external-graphic>
			                                    &#160;Természetes személy                                                             
			                              </fo:block>
			                        </fo:table-cell>
			            		<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-top-style="none"  border-color="rgb(0,0,0)" padding="2pt" padding-left="20pt" text-align="left" background-color="transparent">
			                              <fo:block>
			                                    <fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
			                                          <xslt:attribute name="xf:compat-id">id1837858
			                                                <xslt:value-of select="generate-id(.)"/>
			                                          </xslt:attribute>
			                                          <xsl:choose>
			                                                <xsl:when test="$partner.genderCode=3">
			                                                      <xsl:attribute name="src">
			                                                            <xslt:value-of select="$filledCheckbox"/>
			                                                      </xsl:attribute>
			                                                </xsl:when>
			                                          </xsl:choose>
			                                    </fo:external-graphic>
			                                    &#160;Nem természetes személy                                                             
			                              </fo:block>
			                        </fo:table-cell>
			                  </fo:table-row>                                         
			            </fo:table-body>
			      </fo:table>
		      <!-- ================================== -->
		      <!-- 1. Szerződő adatai táblázat 3. sor -->			      
			      <fo:table table-layout="fixed" border-collapse="collapse">
			            <fo:table-column column-width="proportional-column-width(66.000)" column-number="1"/>
			            <fo:table-column column-width="proportional-column-width(17.000)" column-number="2"/>
			            <fo:table-column column-width="proportional-column-width(17.000)" column-number="3"/>
			            <fo:table-body>
			            	<fo:table-row display-align="center" height="{$firstPageTableRowHeight}">
			                        <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
			                              <fo:block>
			                                    A szerződéskötésre tulajdonos/üzembentartó változás miatt kerül sor:
			                              </fo:block>
			                        </fo:table-cell>
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
			                              <fo:block>
			                                    <fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
			                                          <xslt:attribute name="xf:compat-id">id1837858
			                                                <xslt:value-of select="generate-id(.)"/>
			                                          </xslt:attribute>
			                                          <xsl:choose>
			                                          	<xsl:when test="$policyReasonIsOwnerChanging='true'">
			                                                      <xsl:attribute name="src">
			                                                            <xslt:value-of select="$filledCheckbox"/>
			                                                      </xsl:attribute>
			                                                </xsl:when>
			                                          </xsl:choose>
			                                    </fo:external-graphic>
			                                    &#160;Igen
			                              </fo:block>
			                        </fo:table-cell> 
			                         <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="8pt" text-align="left" background-color="transparent">
			                              <fo:block>
			                                    <fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
			                                          <xslt:attribute name="xf:compat-id">id1837858
			                                                <xslt:value-of select="generate-id(.)"/>
			                                          </xslt:attribute>
			                                          <xsl:choose>
			                                          	<xsl:when test="$policyReasonIsOwnerChanging='false'">
			                                                      <xsl:attribute name="src">
			                                                            <xslt:value-of select="$filledCheckbox"/>
			                                                      </xsl:attribute>
			                                                </xsl:when>
			                                          </xsl:choose>
			                                    </fo:external-graphic>
			                                    &#160;Nem                                                             
			                              </fo:block>
			                        </fo:table-cell>
			                  </fo:table-row>
	                  <!-- ================================== -->
	                  <!-- 1. Szerződő adatai táblázat 4. sor -->
			            	<fo:table-row display-align="center" height="{$firstPageTableRowHeight}">
			                        <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
			                              <fo:block>
			                                    A szerződő tulajdonviszonya:
			                              </fo:block>
			                        </fo:table-cell>
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
			                              <fo:block>
			                                    <fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
			                                          <xslt:attribute name="xf:compat-id">id1837858
			                                                <xslt:value-of select="generate-id(.)"/>
			                                          </xslt:attribute>
			                                          <xsl:choose>
			                                          	<xsl:when test="$partner.ownership=1 or $partner.ownership=3">
			                                                      <xsl:attribute name="src">
			                                                            <xslt:value-of select="$filledCheckbox"/>
			                                                      </xsl:attribute>
			                                                </xsl:when>
			                                          </xsl:choose>
			                                    </fo:external-graphic>
			                                    &#160;Tulajdonos
			                              </fo:block>
			                        </fo:table-cell> 
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="8pt" text-align="left" background-color="transparent">
			                              <fo:block>
			                                    <fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
			                                          <xslt:attribute name="xf:compat-id">id1837858
			                                                <xslt:value-of select="generate-id(.)"/>
			                                          </xslt:attribute>
			                                          <xsl:choose>
			                                          	<xsl:when test="$partner.ownership=2 or $partner.ownership=3">
			                                                      <xsl:attribute name="src">
			                                                            <xslt:value-of select="$filledCheckbox"/>
			                                                      </xsl:attribute>
			                                                </xsl:when>
			                                          </xsl:choose>
			                                    </fo:external-graphic>
			                                    &#160;Üzembentartó                                                             
			                              </fo:block>
			                        </fo:table-cell>
			                  </fo:table-row>   
			            </fo:table-body>
			      </fo:table>
			      <!-- ================================== -->
			      <!-- 1. Szerződő adatai táblázat 5. sor -->		  		     
			      <fo:table table-layout="fixed" border-collapse="collapse">
			            <fo:table-column column-width="proportional-column-width(16.000)" column-number="1"/>
			            <fo:table-column column-width="proportional-column-width(34.000)" column-number="2"/>
			            <fo:table-column column-width="proportional-column-width(16.000)" column-number="3"/>
			            <fo:table-column column-width="proportional-column-width(17.000)" column-number="4"/>
			            <fo:table-column column-width="proportional-column-width(17.000)" column-number="5"/>
			            <fo:table-body>
			            	<fo:table-row display-align="center" height="{$firstPageTableRowHeight}">
			                        <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
			                              <fo:block>
			                                    Név:
			                              </fo:block>
			                        </fo:table-cell>
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
			                              <fo:block>
			                                    <fo:inline>
			                                          <xsl:value-of select="$partner.name"/>
			                                    </fo:inline>
			                              </fo:block>
			                        </fo:table-cell> 
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
			                              <fo:block>
			                                    Neme:                                              
			                              </fo:block>
			                        </fo:table-cell>
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
			                              <fo:block>
			                                    <fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
			                                          <xslt:attribute name="xf:compat-id">id1837858
			                                                <xslt:value-of select="generate-id(.)"/>
			                                          </xslt:attribute>
			                                          <xsl:choose>
			                                                <xsl:when test="$partner.genderCode=1">
			                                                      <xsl:attribute name="src">
			                                                            <xslt:value-of select="$filledCheckbox"/>
			                                                      </xsl:attribute>
			                                                </xsl:when>
			                                          </xsl:choose>
			                                    </fo:external-graphic>
			                                    &#160;Férfi                                                             
			                              </fo:block>
			                        </fo:table-cell>
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="8pt" text-align="left" background-color="transparent">
			                              <fo:block>
			                                    <fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
			                                          <xslt:attribute name="xf:compat-id">id1837858
			                                                <xslt:value-of select="generate-id(.)"/>
			                                          </xslt:attribute>
			                                          <xsl:choose>
			                                                <xsl:when test="$partner.genderCode=2">
			                                                      <xsl:attribute name="src">
			                                                            <xslt:value-of select="$filledCheckbox"/>
			                                                      </xsl:attribute>
			                                                </xsl:when>
			                                          </xsl:choose>
			                                    </fo:external-graphic>
			                                    &#160;Nő                                                             
			                              </fo:block>
			                        </fo:table-cell>
			                  </fo:table-row>			                  
			            </fo:table-body>
			      </fo:table>
			      <!-- ================================== -->
			      <!-- 1. Szerződő adatai táblázat 6. sor -->		    	      
			      <fo:table table-layout="fixed" border-collapse="collapse">
			            <fo:table-column column-width="proportional-column-width(16.000)" column-number="1"/>
			            <fo:table-column column-width="proportional-column-width(34.000)" column-number="2"/>
			            <fo:table-column column-width="proportional-column-width(16.000)" column-number="3"/>
			            <fo:table-column column-width="proportional-column-width(34.000)" column-number="4"/>
			            <fo:table-body>
			            	<fo:table-row display-align="center" height="{$firstPageTableRowHeight}">
			                        <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
			                              <fo:block>
			                                    Telefonszám:
			                              </fo:block>
			                        </fo:table-cell>
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
			                              <fo:block>
			                                    <fo:inline>
			                                          <xsl:value-of select="$partner.phone"/>
			                                    </fo:inline>
			                              </fo:block>
			                        </fo:table-cell> 
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
			                              <fo:block>
			                                    Állampolgársága:
			                              </fo:block>
			                        </fo:table-cell>
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" padding-left="10pt" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="transparent">
			                              <fo:block>
			                                    <fo:inline>
			                                          <xsl:value-of select="$partner.nationality"/>
			                                    </fo:inline>
			                              </fo:block>
			                        </fo:table-cell> 
			                  </fo:table-row>			                  
			            </fo:table-body>
			      </fo:table>
			      <!-- ================================== -->
			      <!-- 1. Szerződő adatai táblázat 7. sor -->		      			      
			      <fo:table table-layout="fixed" border-collapse="collapse">
			            <fo:table-column column-width="proportional-column-width(16.000)" column-number="1"/>
			            <fo:table-column column-width="proportional-column-width(84.000)" column-number="2"/>
			            <fo:table-body>
			            	<fo:table-row display-align="center" height="{$firstPageTableRowHeight}">
			                        <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
			                              <fo:block>
			                                    Mobilszám:
			                              </fo:block>
			                        </fo:table-cell>
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
			                              <fo:block>
			                                    <fo:inline>
			                                          <xsl:value-of select="$partner.mobilePhone"/>
			                                    </fo:inline>
			                              </fo:block>
			                        </fo:table-cell> 
			                  </fo:table-row>
			                  <!-- ================================== -->
			                  <!-- 1. Szerződő adatai táblázat 8. sor -->		                  
			            	<fo:table-row display-align="center" height="{$firstPageTableRowHeight}">
			                        <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
			                              <fo:block>
			                                    E-mail cím:
			                              </fo:block>
			                        </fo:table-cell>
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
			                              <fo:block>
			                                    <fo:inline>
			                                          <xsl:value-of select="$partner.email"/>
			                                    </fo:inline>
			                              </fo:block>
			                        </fo:table-cell> 
			                  </fo:table-row>				                  
			            </fo:table-body>
			      </fo:table>
			      <!-- ================================== -->
			      <!-- 1. Szerződő adatai táblázat 9. sor -->
			      <fo:table table-layout="fixed" border-collapse="collapse">
			            <fo:table-column column-width="proportional-column-width(16.000)" column-number="1"/>
			            <fo:table-column column-width="proportional-column-width(34.000)" column-number="2"/>
			            <fo:table-column column-width="proportional-column-width(16.000)" column-number="3"/>
			            <fo:table-column column-width="proportional-column-width(34.000)" column-number="4"/>
			            <fo:table-body>
			            	<fo:table-row display-align="center" height="{$firstPageTableRowHeight}">
			                        <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
			                              <fo:block>
			                                    Születési dátum:
			                              </fo:block>
			                        </fo:table-cell>
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
			                              <fo:block>
			                                    <fo:inline>
			                                          <xsl:value-of select="$partner.dateOfBirth"/>
			                                    </fo:inline>
			                              </fo:block>
			                        </fo:table-cell> 
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
			                              <fo:block>
			                                    Születési hely:
			                              </fo:block>
			                        </fo:table-cell>
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
			                              <fo:block>
			                                    <fo:inline>
			                                          <xsl:value-of select="$partner.placeOfBirth"/>
			                                    </fo:inline>
			                              </fo:block>
			                        </fo:table-cell>
			                   </fo:table-row>
			            </fo:table-body>
			      </fo:table>
			      <!-- ================================== -->
			      <!-- 1. Szerződő adatai táblázat 10. sor -->		      
			      <fo:table table-layout="fixed" border-collapse="collapse">
			            <fo:table-column column-width="proportional-column-width(16.000)" column-number="1"/>
			            <fo:table-column column-width="proportional-column-width(84.000)" column-number="2"/>
			            <fo:table-body>
			            	<fo:table-row display-align="center" height="{$firstPageTableRowHeight}">
			                        <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
			                              <fo:block>
			                                    Születési név:
			                              </fo:block>
			                        </fo:table-cell>
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
			                              <fo:block>
			                                    <fo:inline>
			                                          <xsl:value-of select="$partner.birthName"/>
			                                    </fo:inline>
			                              </fo:block>
			                        </fo:table-cell> 
			                  </fo:table-row>
			                  <!-- ================================== -->
			                  <!-- 1. Szerződő adatai táblázat 11. sor -->	                  
			            	<fo:table-row display-align="center" height="{$firstPageTableRowHeight}">
			                        <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
			                              <fo:block>
			                                    Anyja neve:
			                              </fo:block>
			                        </fo:table-cell>
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
			                              <fo:block>
			                                    <fo:inline>
			                                          <xsl:value-of select="$partner.mothersName"/>
			                                    </fo:inline>
			                              </fo:block>
			                        </fo:table-cell> 
			                  </fo:table-row>				                  
			            </fo:table-body>
			      </fo:table>
			      <!-- ================================== -->
			      <!-- 1. Szerződő adatai táblázat 12. sor -->				      
			      <fo:table table-layout="fixed" border-collapse="collapse">
			            <fo:table-column column-width="proportional-column-width(16.000)" column-number="1"/>
			            <fo:table-column column-width="proportional-column-width(34.000)" column-number="2"/>
			            <fo:table-column column-width="proportional-column-width(16.000)" column-number="3"/>
			            <fo:table-column column-width="proportional-column-width(34.000)" column-number="4"/>
			            <fo:table-body>
			            	<fo:table-row display-align="center" height="{$firstPageTableRowHeight}">
			                        <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
			                              <fo:block>
			                                    Adószám:
			                              </fo:block>
			                        </fo:table-cell>
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
			                              <fo:block>
			                                    <fo:inline>
			                                          <xsl:value-of select="$partner.taxNumber"/>
			                                    </fo:inline>
			                              </fo:block>
			                        </fo:table-cell> 
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
			                              <fo:block>
			                                    Cégjegyzékszám:
			                              </fo:block>
			                        </fo:table-cell>
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
			                              <fo:block>
			                                    <fo:inline>
			                                          <xsl:value-of select="$partner.tradeRegisterNumber"/>
			                                    </fo:inline>
			                              </fo:block>
			                        </fo:table-cell>
			                  </fo:table-row>
			            </fo:table-body>
			      </fo:table>
			      <!-- ================================== -->
			      <!-- 1. Szerződő adatai táblázat 13. sor -->			      
			      <fo:table table-layout="fixed" border-collapse="collapse">
			            <fo:table-column column-width="proportional-column-width(20.000)" column-number="1"/>
			            <fo:table-column column-width="proportional-column-width(30.000)" column-number="2"/>
			            <fo:table-column column-width="proportional-column-width(30.000)" column-number="3"/>
			            <fo:table-column column-width="proportional-column-width(20.000)" column-number="4"/>
			            <fo:table-body>
			            	<fo:table-row display-align="center" height="{$firstPageTableRowHeight}">
			                        <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
			                              <fo:block>
			                                    Jogosítvány száma:
			                              </fo:block>
			                        </fo:table-cell>
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
			                              <fo:block>
			                                    <fo:inline>
			                                          <xsl:value-of select="$partner.drivingLicenseNumber"/>
			                                    </fo:inline>
			                              </fo:block>
			                        </fo:table-cell> 
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
			                              <fo:block>
			                                    Jogosítvány megszerzésének éve:
			                              </fo:block>
			                        </fo:table-cell>
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
			                              <fo:block>
			                                    <fo:inline>
			                                          <xsl:value-of select="$partner.yearOfDrivingLicense"/>
			                                    </fo:inline>
			                              </fo:block>
			                        </fo:table-cell>
			                  </fo:table-row>
			            </fo:table-body>
			      </fo:table>
			      <!-- ================================== -->
			      <!-- 1. Szerződő adatai táblázat 14. sor -->			      
			      <fo:table table-layout="fixed" border-collapse="collapse">
			            <fo:table-column column-width="proportional-column-width(28.000)" column-number="1"/>
			            <fo:table-column column-width="proportional-column-width(13.000)" column-number="2"/>
			            <fo:table-column column-width="proportional-column-width(9.000)" column-number="3"/>
			            <fo:table-column column-width="proportional-column-width(16.000)" column-number="4"/>
			            <fo:table-column column-width="proportional-column-width(34.000)" column-number="5"/>
			            <fo:table-body>
			            	<fo:table-row display-align="center" height="{$firstPageTableRowHeight}">
			                        <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
			                              <fo:block>
			                                    Állandó lakcím/Székhely:
			                              </fo:block>
			                        </fo:table-cell>
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
			                              <fo:block>
			                                    Irányítószám:
			                              </fo:block>
			                        </fo:table-cell>
			                        
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="center" background-color="transparent">
			                              <fo:block>
			                                    <fo:inline>
			                                          <xsl:value-of select="$partner.permanentAddress.postCode"/>
			                                    </fo:inline>
			                              </fo:block>
			                        </fo:table-cell> 
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
			                              <fo:block>
			                                    Település:
			                              </fo:block>
			                        </fo:table-cell>
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
			                              <fo:block>
			                                    <fo:inline>
			                                          <xsl:value-of select="$partner.permanentAddress.city"/>
			                                    </fo:inline>
			                              </fo:block>
			                        </fo:table-cell>
			                  </fo:table-row>
			            </fo:table-body>
			      </fo:table>
			      <!-- ================================== -->
			      <!-- 1. Szerződő adatai táblázat 15. sor -->		      
			      <fo:table table-layout="fixed" border-collapse="collapse">
			            <fo:table-column column-width="proportional-column-width(25.000)" column-number="1"/>
			            <fo:table-column column-width="proportional-column-width(75.000)" column-number="2"/>
			            <fo:table-body>
			            	<fo:table-row display-align="center" height="{$firstPageTableRowHeight}">
			                        <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
			                              <fo:block>
			                                    Utca, házszám, emelet, ajtó:
			                              </fo:block>
			                        </fo:table-cell>
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
			                              <fo:block>
			                                    <fo:inline>
			                                          <xsl:value-of select="$partner.permanentAddress.addressLine1"/>
			                                    </fo:inline>, <fo:inline>
			                                          <xsl:value-of select="$partner.permanentAddress.addressLine2"/>
			                                    </fo:inline>		                                    
			                              </fo:block>
			                        </fo:table-cell> 
			                  </fo:table-row>			                		                  
			            </fo:table-body>
			      </fo:table>
			      <!-- ================================== -->
			      <!-- 1. Szerződő adatai táblázat 16. sor -->			      
			      <fo:table table-layout="fixed" border-collapse="collapse">
			            <fo:table-column column-width="proportional-column-width(28.000)" column-number="1"/>
			            <fo:table-column column-width="proportional-column-width(13.000)" column-number="2"/>
			            <fo:table-column column-width="proportional-column-width(9.000)" column-number="3"/>
			            <fo:table-column column-width="proportional-column-width(16.000)" column-number="4"/>
			            <fo:table-column column-width="proportional-column-width(34.000)" column-number="5"/>
			            <fo:table-body>
			            	<fo:table-row display-align="center" height="{$firstPageTableRowHeight}">
			                        <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
			                              <fo:block>
			                                    Levelezési cím:
			                              </fo:block>
			                        </fo:table-cell>
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
			                              <fo:block>
			                                    Irányítószám:
			                              </fo:block>
			                        </fo:table-cell>
			                        
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="center" background-color="transparent">
			                              <fo:block>
			                                    <fo:inline>
			                                          <xsl:value-of select="$partner.mailingAddress.postCode"/>
			                                    </fo:inline>
			                              </fo:block>
			                        </fo:table-cell> 
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
			                              <fo:block>
			                                    Település:
			                              </fo:block>
			                        </fo:table-cell>
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
			                              <fo:block>
			                                    <fo:inline>
			                                    	<xsl:value-of select="$partner.mailingAddress.city"/>
			                                    </fo:inline>
			                              </fo:block>
			                        </fo:table-cell>
			                  </fo:table-row>
			            </fo:table-body>
			      </fo:table>
			      <!-- ================================== -->
			      <!-- 1. Szerződő adatai táblázat 17. sor -->			      
			      <fo:table table-layout="fixed" border-collapse="collapse">
			            <fo:table-column column-width="proportional-column-width(25.000)" column-number="1"/>
			            <fo:table-column column-width="proportional-column-width(75.000)" column-number="2"/>
			            <fo:table-body>
			            	<fo:table-row display-align="center" height="{$firstPageTableRowHeight}">
			                        <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
			                              <fo:block>
			                                    Utca, házszám, emelet, ajtó:
			                              </fo:block>
			                        </fo:table-cell>
			                        <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
			                              <fo:block>
			                                    <fo:inline>
			                                    	<xsl:value-of select="$partner.mailingAddress.addressLine1"/>
			                                    </fo:inline>, <fo:inline>
			                                    	<xsl:value-of select="$partner.mailingAddress.addressLine2"/>	
			                                    </fo:inline>			                                    	
			                              </fo:block>
			                        </fo:table-cell> 
			                  </fo:table-row>			                		                  
			            </fo:table-body>
			      </fo:table>
		      </fo:block>
		      <fo:block font-weight="normal" display-align="auto"> </fo:block>
			<fo:block font-weight="normal" display-align="auto"> </fo:block>
		      <fo:block font-weight="normal">		            
<!-- ======================================================= -->
<!-- ======================================================= -->
<!-- 2. Előzmény/Párhuzamos szerződés adatai táblázat 1. sor -->			      
                        <fo:table table-layout="fixed" border-collapse="collapse">
                              <fo:table-column column-width="proportional-column-width(100.000)" column-number="1"/>
                              <fo:table-body>
                              	<fo:table-row height="{$firstPageTableRowHeight}">
                                          <fo:table-cell display-align="center" border-width="thin" border-style="none" background-color="{$mkbbRed}" padding="2pt" color="rgb(255,255,255)" text-align="center">
                                              <fo:block>2. ELŐZMÉNY/PÁRHUZAMOS SZERZŐDÉS ADATAI</fo:block>
                                         </fo:table-cell>
                                    </fo:table-row>                                
                              </fo:table-body>
                        </fo:table>
		     <!-- ================================== -->
                 <!-- 2. Előzmény/Párhuzamos szerződés adatai táblázat 2. sor -->
		            <fo:table table-layout="fixed" border-collapse="collapse">
		                  <fo:table-column column-width="proportional-column-width(20.000)" column-number="1"/>
		                  <fo:table-column column-width="proportional-column-width(30.000)" column-number="2"/>
		                  <fo:table-column column-width="proportional-column-width(23.000)" column-number="3"/>
		                  <fo:table-column column-width="proportional-column-width(27.000)" column-number="4"/>
		                  <fo:table-body>
		                  	<fo:table-row display-align="center" height="{$firstPageTableRowHeight}">
		                              <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		                                    <fo:block>
		                                          Biztosító neve:
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:inline>
		                                                <xsl:value-of select="$antecedentPolicy.insurantName"/>
		                                          </fo:inline>
		                                    </fo:block>
		                              </fo:table-cell> 
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		                                    <fo:block>
		                                          Szerződés azonosító:
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" padding-left="10pt" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:inline>
		                                                <xsl:value-of select="$antecedentPolicy.policyId"/>
		                                          </fo:inline>
		                                    </fo:block>
		                              </fo:table-cell> 
		                        </fo:table-row>			                  
		                  </fo:table-body>
		            </fo:table>
		            <!-- ======================================================= -->
		            <!-- 2. Előzmény/Párhuzamos szerződés adatai táblázat 3. sor -->			      
		            <fo:table table-layout="fixed" border-collapse="collapse">
		                  <fo:table-column column-width="proportional-column-width(20.000)" column-number="1"/>
		                  <fo:table-column column-width="proportional-column-width(18.000)" column-number="2"/>
		                  <fo:table-column column-width="proportional-column-width(15.000)" column-number="3"/>
		                  <fo:table-column column-width="proportional-column-width(18.000)" column-number="4"/>
		                  <fo:table-column column-width="proportional-column-width(29.000)" column-number="5"/>
		                  <fo:table-body>
		                  	<fo:table-row display-align="center" height="{$firstPageTableRowHeight}">
		                              <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		                                    <fo:block>
		                                          Megszűnés oka:
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="20pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		                                                <xslt:attribute name="xf:compat-id">id1837858
		                                                      <xslt:value-of select="generate-id(.)"/>
		                                                </xslt:attribute>
		                                                <xsl:choose>
		                                                      <xsl:when test="$antecedentPolicy.cessationReason=1">
		                                                            <xsl:attribute name="src">
		                                                                  <xslt:value-of select="$filledCheckbox"/>
		                                                            </xsl:attribute>
		                                                      </xsl:when>
		                                                </xsl:choose>
		                                          </fo:external-graphic>
		                                          &#160;Érdekmúlás
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		                                                <xslt:attribute name="xf:compat-id">id1837858
		                                                      <xslt:value-of select="generate-id(.)"/>
		                                                </xslt:attribute>
		                                                <xsl:choose>
		                                                	<xsl:when test="$antecedentPolicy.cessationReason=2">
		                                                            <xsl:attribute name="src">
		                                                                  <xslt:value-of select="$filledCheckbox"/>
		                                                            </xsl:attribute>
		                                                      </xsl:when>
		                                                </xsl:choose>
		                                          </fo:external-graphic>
		                                          &#160;Felmondás
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="11pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		                                                <xslt:attribute name="xf:compat-id">id1837858
		                                                      <xslt:value-of select="generate-id(.)"/>
		                                                </xslt:attribute>
		                                                <xsl:choose>
		                                                	<xsl:when test="$antecedentPolicy.cessationReason=3">
		                                                            <xsl:attribute name="src">
		                                                                  <xslt:value-of select="$filledCheckbox"/>
		                                                            </xsl:attribute>
		                                                      </xsl:when>
		                                                </xsl:choose>
		                                          </fo:external-graphic>
		                                          &#160;Díjnemfizetés
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		                                                <xslt:attribute name="xf:compat-id">id1837858
		                                                      <xslt:value-of select="generate-id(.)"/>
		                                                </xslt:attribute>
		                                                <xsl:choose>
		                                                	<xsl:when test="$antecedentPolicy.cessationReason=4">
		                                                            <xsl:attribute name="src">
		                                                                  <xslt:value-of select="$filledCheckbox"/>
		                                                            </xsl:attribute>
		                                                      </xsl:when>
		                                                </xsl:choose>
		                                          </fo:external-graphic>
		                                          &#160;Forgalomból kivonás
		                                    </fo:block>
		                              </fo:table-cell>
		                        </fo:table-row>
		                  </fo:table-body>
		            </fo:table>
            <!-- ======================================================= -->
            <!-- 2. Előzmény/Párhuzamos szerződés adatai táblázat 4. sor -->			      
		            <fo:table table-layout="fixed" border-collapse="collapse">
		                  <fo:table-column column-width="proportional-column-width(20.000)" column-number="1"/>
		                  <fo:table-column column-width="proportional-column-width(80.000)" column-number="2"/>
		                  <fo:table-body>
		                  	<fo:table-row display-align="center" height="{$firstPageTableRowHeight}">
		                              <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		                                    <fo:block>
		                                          Forgalmi rendszám:
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:inline>
		                                                <xsl:value-of select="$antecedentPolicy.registrationNumber"/>
		                                          </fo:inline>  
		                                    </fo:block>
		                              </fo:table-cell>
		                        </fo:table-row>
		                  </fo:table-body>
		            </fo:table>
	        <!-- ================================== -->
	        <!-- 2. Előzmény/Párhuzamos szerződés adatai táblázat 5. sor -->
		            <fo:table table-layout="fixed" border-collapse="collapse">
		                  <fo:table-column column-width="proportional-column-width(20.000)" column-number="1"/>
		                  <fo:table-column column-width="proportional-column-width(30.000)" column-number="2"/>
		                  <fo:table-column column-width="proportional-column-width(23.000)" column-number="3"/>
		                  <fo:table-column column-width="proportional-column-width(27.000)" column-number="4"/>
		                  <fo:table-body>
		                  	<fo:table-row display-align="center" height="{$firstPageTableRowHeight}">
		                              <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		                                    <fo:block>
		                                          Megszűnés dátuma:
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:inline>
		                                                <xsl:value-of select="$antecedentPolicy.dateOfCessation"/>
		                                          </fo:inline>
		                                    </fo:block>
		                              </fo:table-cell> 
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		                                    <fo:block>
		                                          Záró bonus-malus fokozat:
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" padding-left="10pt" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:inline>
		                                                <xsl:value-of select="$antecedentPolicy.bonusMalus"/>
		                                          </fo:inline>
		                                    </fo:block>
		                              </fo:table-cell> 
		                        </fo:table-row>			                  
		                  </fo:table-body>
		            </fo:table>
            <!-- ================================== -->
            <!-- 2. Előzmény/Párhuzamos szerződés adatai táblázat 6. sor -->
		            <fo:table table-layout="fixed" border-collapse="collapse">
		                  <fo:table-column column-width="proportional-column-width(100.000)" column-number="1"/>
		                  <fo:table-body>
		                  	<fo:table-row display-align="center" height="{$firstPageTableRowHeight}">
		                              <fo:table-cell border-width="thin" border-style="solid" border-bottom-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		                                    <fo:block>
		                                          Extra kármentességi kedvezmény:
		                                    </fo:block>
		                              </fo:table-cell>
		                        </fo:table-row>			                  
		                  </fo:table-body>
		            </fo:table>
            <!-- ================================== -->
            <!-- 2. Előzmény/Párhuzamos szerződés adatai táblázat 7. sor (1. nyilatkozat) -->
		            <fo:table table-layout="fixed" border-collapse="collapse">
		                  <fo:table-column column-width="proportional-column-width(100.000)" column-number="1"/>
		                  <fo:table-body>
		                  	<fo:table-row display-align="center" padding-top="5pt">
		                              <fo:table-cell border-width="thin" border-style="solid" border-bottom-style="none" border-top-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="20pt" padding-top="10pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:list-block  provisional-label-separation="5pt" provisional-distance-between-starts="10pt">		                                                
		                                                <fo:list-item>
		                                                      <fo:list-item-label end-indent="label-end()">
		                                                            <fo:block>&#8226;</fo:block>
		                                                      </fo:list-item-label>
		                                                      <fo:list-item-body start-indent="body-start()">
		                                                            <fo:block>Nyilatkozom, hogy 2007. 01. 01. óta folyamatosan &#8211; összesen legfeljebb 180 nap megszakítással &#8211; személygépkocsira vonatkozó felelősségbiztosítással rendelkezem:</fo:block>
		                                                      </fo:list-item-body>
		                                                </fo:list-item>
		                                          </fo:list-block>		                                          
		                                    </fo:block>
		                              </fo:table-cell>
		                        </fo:table-row>			                  
		                  </fo:table-body>
		            </fo:table>
	       <!-- ================================== -->
	       <!-- 2. Előzmény/Párhuzamos szerződés adatai táblázat 8. sor (1. nyilatkozat - igen / nem) -->
		            <fo:table table-layout="fixed" border-collapse="collapse">
		                  <fo:table-column column-width="proportional-column-width(50.000)" column-number="1"/>
		                  <fo:table-column column-width="proportional-column-width(50.000)" column-number="2"/>
		                  <fo:table-body>
		                        <fo:table-row display-align="center">
		                              <fo:table-cell border-width="thin"  border-left-style="solid" border-left-color="rgb(0,0,0)" padding="2pt" padding-right="20pt" padding-bottom="10pt" text-align="right" background-color="transparent">
		                                    <fo:block>
		                                          <fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		                                                <xslt:attribute name="xf:compat-id">id1837858
		                                                      <xslt:value-of select="generate-id(.)"/>
		                                                </xslt:attribute>
		                                                <xsl:choose>
		                                                      <xsl:when test="$declaration.continuousMTPL=1">
		                                                            <xsl:attribute name="src">
		                                                                  <xslt:value-of select="$filledCheckbox"/>
		                                                            </xsl:attribute>
		                                                      </xsl:when>
		                                                </xsl:choose>
		                                          </fo:external-graphic>
		                                          &#160;Igen	                                          
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-right-style="solid" border-left-color="rgb(0,0,0)" padding="2pt" padding-left="20pt" padding-bottom="10pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		                                                <xslt:attribute name="xf:compat-id">id1837858
		                                                      <xslt:value-of select="generate-id(.)"/>
		                                                </xslt:attribute>
		                                                <xsl:choose>
		                                                	<xsl:when test="$declaration.continuousMTPL=0">
		                                                            <xsl:attribute name="src">
		                                                                  <xslt:value-of select="$filledCheckbox"/>
		                                                            </xsl:attribute>
		                                                      </xsl:when>
		                                                </xsl:choose>
		                                          </fo:external-graphic>
		                                          &#160;Nem		                                          
		                                    </fo:block>
		                              </fo:table-cell>
		                        </fo:table-row>			                  
		                  </fo:table-body>
		            </fo:table>
            <!-- ================================== -->
            <!-- 2. Előzmény/Párhuzamos szerződés adatai táblázat 9. sor (2. nyilatkozat) -->
		            <fo:table table-layout="fixed" border-collapse="collapse">
		                  <fo:table-column column-width="proportional-column-width(100.000)" column-number="1"/>
		                  <fo:table-body>
		                        <fo:table-row display-align="center" padding-top="5pt">
		                              <fo:table-cell border-width="thin" border-style="solid" border-bottom-style="none" border-top-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="20pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:list-block  provisional-label-separation="5pt" provisional-distance-between-starts="10pt">		                                                
		                                                <fo:list-item>
		                                                      <fo:list-item-label end-indent="label-end()">
		                                                            <fo:block>&#8226;</fo:block>
		                                                      </fo:list-item-label>
		                                                      <fo:list-item-body start-indent="body-start()">
		                                                            <fo:block>Nyilatkozom, hogy 2007. 01. 01. és az ajánlat aláírásának időpontja közötti időszakban KGFB szerződőjeként nem okoztam kárt
		                                                                  és az előzménybiztosítás kártörténeti igazolása alapján a 2011. évben kezdődő biztosítási időszakra megállapított bonus-malus besorolás
		                                                                  nem malus osztályú és a kártörténeti igazoláson nem szerepel káresemény:</fo:block>
		                                                      </fo:list-item-body>
		                                                </fo:list-item>
		                                          </fo:list-block>		                                          
		                                    </fo:block>
		                              </fo:table-cell>
		                        </fo:table-row>			                  
		                  </fo:table-body>
		            </fo:table>
            <!-- ================================== -->
            <!-- 2. Előzmény/Párhuzamos szerződés adatai táblázat 10. sor (2. nyilatkozat - igen / nem) -->
		            <fo:table table-layout="fixed" border-collapse="collapse">
		                  <fo:table-column column-width="proportional-column-width(50.000)" column-number="1"/>
		                  <fo:table-column column-width="proportional-column-width(50.000)" column-number="2"/>
		                  <fo:table-body>
		                        <fo:table-row display-align="center">
		                              <fo:table-cell border-width="thin"  border-left-style="solid" border-bottom-style="solid" border-color="rgb(0,0,0)" padding="2pt" padding-right="20pt" padding-bottom="10pt" text-align="right" background-color="transparent">
		                                    <fo:block>
		                                          <fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		                                                <xslt:attribute name="xf:compat-id">id1837858
		                                                      <xslt:value-of select="generate-id(.)"/>
		                                                </xslt:attribute>
		                                                <xsl:choose>
		                                                	<xsl:when test="$declaration.claimless=1">
		                                                            <xsl:attribute name="src">		                                                         
		                                                                  <xslt:value-of select="$filledCheckbox"/>
		                                                            </xsl:attribute>
		                                                      </xsl:when>
		                                                </xsl:choose>
		                                          </fo:external-graphic>
		                                          &#160;Igen	                                          
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-right-style="solid" border-bottom-style="solid" border-color="rgb(0,0,0)" padding="2pt" padding-left="20pt" padding-bottom="10pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		                                                <xslt:attribute name="xf:compat-id">id1837858
		                                                      <xslt:value-of select="generate-id(.)"/>
		                                                </xslt:attribute>
		                                                <xsl:choose>
		                                                	<xsl:when test="$declaration.claimless=0">
		                                                            <xsl:attribute name="src">
		                                                                  <xslt:value-of select="$filledCheckbox"/>
		                                                            </xsl:attribute>
		                                                      </xsl:when>
		                                                </xsl:choose>
		                                          </fo:external-graphic>
		                                          &#160;Nem		                                          
		                                    </fo:block>
		                              </fo:table-cell>
		                        </fo:table-row>			                  
		                  </fo:table-body>
		            </fo:table>
		      </fo:block>		
		      <fo:block break-after="page"> </fo:block>
		</fo:flow>
      </fo:page-sequence>
	  <fo:page-sequence master-reference="A4Page">
				<fo:static-content flow-name="xsl-region-before" font-size="12pt" font-family="Arial">
					<fo:block> </fo:block>
				</fo:static-content>
				<fo:static-content flow-name="xsl-region-after" font-size="12pt" font-family="Arial">
					<fo:block text-align="center">
						<!--<fo:page-number/> -->
					</fo:block>
				</fo:static-content>
				<fo:static-content flow-name="xsl-region-start" font-size="12pt" font-family="Arial">
					<fo:block>
					</fo:block>
				</fo:static-content>
				<fo:static-content flow-name="xsl-region-end" font-size="12pt" font-family="Arial">
					<fo:block> </fo:block>
				</fo:static-content>
	  	<fo:flow flow-name="xsl-region-body" font-family="Arial" font-size="8pt">
		      <!-- ================================= -->
		      <!--  2. oldal -->
		      <!-- Ajánlatszám táblázat -->
		      <fo:block font-weight="normal" display-align="auto">
		            <!-- ================================== -->
		            <!-- Ajánlatszám táblázat --> 
		            <fo:table table-layout="fixed" border-collapse="collapse">
		                  <fo:table-column column-width="proportional-column-width(50.000)" column-number="1"/>
		                  <fo:table-column column-width="proportional-column-width(16.000)" column-number="2"/>
		                  <fo:table-column column-width="proportional-column-width(34.000)" column-number="3"/>
		                  <fo:table-body>
		                  	<fo:table-row height="{$quoteNumberTableHeight}">
		                              <fo:table-cell border-style="none">
		                                    <fo:block> </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell display-align="center" border-width="thin" border-right-style="none" border-style="solid" background-color="{$tableCellBackGround}" padding="2pt" color="rgb(0,0,0)" text-align="left">
		                                    <fo:block>Ajánlatszám:</fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell font-weight="bold" display-align="center" border-width="thin" border-left-style="none" border-style="solid" padding="2pt" padding-left="10pt" text-align="left">
		                                    <fo:block>
		                                          <fo:inline>
		                                                <xsl:value-of select="$quoteNumber"/>
		                                          </fo:inline>
		                                    </fo:block>
		                              </fo:table-cell>
		                        </fo:table-row>                                
		                  </fo:table-body>
		            </fo:table>
		      </fo:block>
		      <fo:block font-weight="normal" display-align="auto"> </fo:block>
		      <fo:block font-weight="normal">
		            <!-- ================================== -->
		            <!-- 3. Biztosított Jármű táblázat 1. sor -->			      
		            <fo:table table-layout="fixed" border-collapse="collapse">
		                  <fo:table-column column-width="proportional-column-width(100.000)" column-number="1"/>
		                  <fo:table-body>
		                  	<fo:table-row height="{$secondPageTableRowHeight}">
		                              <fo:table-cell display-align="center" border-width="thin" border-style="none" background-color="{$mkbbRed}" padding="2pt" color="rgb(255,255,255)" text-align="center">
		                                    <fo:block>3. BIZTOSÍTOTT JÁRMŰ</fo:block>
		                              </fo:table-cell>
		                        </fo:table-row>                                
		                  </fo:table-body>
		            </fo:table>
		            <!-- ================================== -->
		            <!-- 3. Biztosított Jármű táblázat 2. sor -->
		            <fo:table table-layout="fixed" border-collapse="collapse">
		                  <fo:table-column column-width="proportional-column-width(23.000)" column-number="1"/>
		                  <fo:table-column column-width="proportional-column-width(23.000)" column-number="2"/>
		                  <fo:table-column column-width="proportional-column-width(18.000)" column-number="3"/>
		                  <fo:table-column column-width="proportional-column-width(18.000)" column-number="4"/>
		            	  <fo:table-column column-width="proportional-column-width(18.000)" column-number="5"/>
		                  <fo:table-body>
		                  	<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
		                              <fo:table-cell border-width="thin" border-style="solid" border-bottom-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		                                    <fo:block>
		                                          A jármű fajtája:                                                             
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-top-style="solid" border-color="rgb(0,0,0)" padding="2pt" padding-left="8pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		                                                <xslt:attribute name="xf:compat-id">id1837858
		                                                      <xslt:value-of select="generate-id(.)"/>
		                                                </xslt:attribute>
		                                                <xsl:choose>
		                                                      <xsl:when test="$vehicle.typeCode=10">
		                                                            <xsl:attribute name="src">
		                                                                  <xslt:value-of select="$filledCheckbox"/>
		                                                            </xsl:attribute>
		                                                      </xsl:when>
		                                                </xsl:choose>
		                                          </fo:external-graphic>
		                                          &#160;személygépkocsi
		                                    </fo:block>
		                              </fo:table-cell>
		                  			  <fo:table-cell border-width="thin" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
		                  				<fo:block>
		                  					<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		                  						<xslt:attribute name="xf:compat-id">id1837858
		                  							<xslt:value-of select="generate-id(.)"/>
		             	     					</xslt:attribute>
		                	  					<xsl:choose>
		                  							<xsl:when test="$vehicle.typeCode=11">
		                  								<xsl:attribute name="src">
		                  									<xslt:value-of select="$filledCheckbox"/>
		                  								</xsl:attribute>
		    	              						</xsl:when>
		        	          					</xsl:choose>
		            	      				</fo:external-graphic>
		                	  				&#160;motorkerékpár
		                  				</fo:block>
		                  	  		  </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-top-style="solid" border-color="rgb(0,0,0)" padding="2pt" padding-left="8pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		                                                <xslt:attribute name="xf:compat-id">id1837858
		                                                      <xslt:value-of select="generate-id(.)"/>
		                                                </xslt:attribute>
		                                                <xsl:choose>
		                                                      <xsl:when test="$vehicle.typeCode=14">
		                                                            <xsl:attribute name="src">
		                                                                  <xslt:value-of select="$filledCheckbox"/>
		                                                            </xsl:attribute>
		                                                      </xsl:when>
		                                                </xsl:choose>
		                                          </fo:external-graphic>
		                                          &#160;tehergépkocsi
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-top-style="solid" border-right-style="solid" border-color="rgb(0,0,0)" padding="2pt" padding-left="8pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		                                                <xslt:attribute name="xf:compat-id">id1837858
		                                                      <xslt:value-of select="generate-id(.)"/>
		                                                </xslt:attribute>
		                                                <xsl:choose>
		                                                      <xsl:when test="$vehicle.typeCode=12">
		                                                            <xsl:attribute name="src">
		                                                                  <xslt:value-of select="$filledCheckbox"/>
		                                                            </xsl:attribute>
		                                                      </xsl:when>
		                                                </xsl:choose>
		                                          </fo:external-graphic>
		                                          &#160;autóbusz
		                                    </fo:block>
		                              </fo:table-cell>
		                        </fo:table-row>                                         
		                  </fo:table-body>
		            </fo:table>
		            <!-- ================================== -->
		            <!-- 3. Biztosított Jármű táblázat 3. sor (troli...stb.) -->
		            <fo:table table-layout="fixed" border-collapse="collapse">
		                  <fo:table-column column-width="proportional-column-width(23.000)" column-number="1"/>
		                  <fo:table-column column-width="proportional-column-width(23.000)" column-number="2"/>
		                  <fo:table-column column-width="proportional-column-width(18.000)" column-number="3"/>
		                  <fo:table-column column-width="proportional-column-width(18.000)" column-number="4"/>
		            	  <fo:table-column column-width="proportional-column-width(18.000)" column-number="5"/>
		                  <fo:table-body>
		                  	<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
		                              <fo:table-cell border-width="thin" border-left-style="solid" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="{$tableCellBackGround}">
		                                    <fo:block> </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="8pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		                                                <xslt:attribute name="xf:compat-id">id1837858
		                                                      <xslt:value-of select="generate-id(.)"/>
		                                                </xslt:attribute>
		                                                <xsl:choose>
		                                                      <xsl:when test="$vehicle.typeCode=21">
		                                                            <xsl:attribute name="src">
		                                                                  <xslt:value-of select="$filledCheckbox"/>
		                                                            </xsl:attribute>
		                                                      </xsl:when>
		                                                </xsl:choose>
		                                          </fo:external-graphic>
		                                          &#160;mezőgazdasági vontató
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		                                                <xslt:attribute name="xf:compat-id">id1837858
		                                                      <xslt:value-of select="generate-id(.)"/>
		                                                </xslt:attribute>
		                                                <xsl:choose>
		                                                      <xsl:when test="$vehicle.typeCode=15">
		                                                            <xsl:attribute name="src">
		                                                                  <xslt:value-of select="$filledCheckbox"/>
		                                                            </xsl:attribute>
		                                                      </xsl:when>
		                                                </xsl:choose>
		                                          </fo:external-graphic>
		                                          &#160;vontató
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-color="rgb(0,0,0)" padding="2pt" padding-left="8pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		                                                <xslt:attribute name="xf:compat-id">id1837858
		                                                      <xslt:value-of select="generate-id(.)"/>
		                                                </xslt:attribute>
		                                                <xsl:choose>
		                                                      <xsl:when test="$vehicle.typeCode=23">
		                                                            <xsl:attribute name="src">
		                                                                  <xslt:value-of select="$filledCheckbox"/>
		                                                            </xsl:attribute>
		                                                      </xsl:when>
		                                                </xsl:choose>
		                                          </fo:external-graphic>
		                                    	&#160;munkagép
		                                    </fo:block>
		                              </fo:table-cell>
		                  		<fo:table-cell border-width="thin" border-right-style="solid" border-color="rgb(0,0,0)" padding="2pt" padding-left="8pt" text-align="left" background-color="transparent">
		                  			<fo:block>
		                  				<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		                  					<xslt:attribute name="xf:compat-id">id1837858
		                  						<xslt:value-of select="generate-id(.)"/>
		                  					</xslt:attribute>
		                  					<xsl:choose>
		                  						<xsl:when test="$vehicle.typeCode=22">
		                  							<xsl:attribute name="src">
		                  								<xslt:value-of select="$filledCheckbox"/>
		                  							</xsl:attribute>
		                  						</xsl:when>
		                  					</xsl:choose>
		                  				</fo:external-graphic>
		                  				&#160;lassújármű
		                  			</fo:block>
		                  		</fo:table-cell>
		                        </fo:table-row>                                         
		                  </fo:table-body>
		            </fo:table>		
		            <!-- ================================== -->
		            <!-- 3. Biztosított Jármű táblázat 5. sor (személygépkocsi utánfutó...stb.) -->
		            <fo:table table-layout="fixed" border-collapse="collapse">
		            	  <fo:table-column column-width="proportional-column-width(23.000)" column-number="1"/>	
		                  <fo:table-column column-width="proportional-column-width(59.000)" column-number="2"/>
		            	  <fo:table-column column-width="proportional-column-width(18.000)" column-number="3"/>		            	
		                  <fo:table-body>
		                  	<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
		                  		<fo:table-cell border-width="thin" border-left-style="solid" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="{$tableCellBackGround}">
		                  			<fo:block> </fo:block>
		                  		</fo:table-cell>
		                              <fo:table-cell border-width="thin" border-color="rgb(0,0,0)" padding="2pt" padding-left="8pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		                                                <xslt:attribute name="xf:compat-id">id1837858
		                                                      <xslt:value-of select="generate-id(.)"/>
		                                                </xslt:attribute>
		                                                <xsl:choose>
		                                                      <xsl:when test="$vehicle.typeCode=16">
		                                                            <xsl:attribute name="src">
		                                                                  <xslt:value-of select="$filledCheckbox"/>
		                                                            </xsl:attribute>
		                                                      </xsl:when>
		                                                </xsl:choose>
		                                          </fo:external-graphic>
		                                    	&#160;Pótkocsi, félpótkocsi 0,75 t megengedett legnagyobb össztömegig
		                                    </fo:block>
		                              </fo:table-cell>
		                  		<fo:table-cell border-width="thin" border-right-style="solid" border-color="rgb(0,0,0)" padding="2pt" padding-left="8pt" text-align="left" background-color="transparent">
		                  			<fo:block>
		                  				<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		                  					<xslt:attribute name="xf:compat-id">id1837858
		                  						<xslt:value-of select="generate-id(.)"/>
		                  					</xslt:attribute>
		                  					<xsl:choose>
		                  						<xsl:when test="$vehicle.typeCode=13">
		                  							<xsl:attribute name="src">
		                  								<xslt:value-of select="$filledCheckbox"/>
		                  							</xsl:attribute>
		                  						</xsl:when>
		                  					</xsl:choose>
		                  				</fo:external-graphic>
		                  				&#160;trolibusz
		                  			</fo:block>
		                  		</fo:table-cell>
		                        </fo:table-row>                                         
		                  </fo:table-body>
		            </fo:table>
		      	<!-- ================================== -->
		      	<!-- 3. Biztosított Jármű táblázat 4. sor (segédmotoros kerékpár...stb.) -->
		      	<fo:table table-layout="fixed" border-collapse="collapse">
		      		<fo:table-column column-width="proportional-column-width(23.000)" column-number="1"/>
		      		<fo:table-column column-width="proportional-column-width(59.000)" column-number="2"/>		 
		      		<fo:table-column column-width="proportional-column-width(18.000)" column-number="3"/>		      	
		      		<fo:table-body>
		      			<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
		      				<fo:table-cell border-width="thin" border-left-style="solid" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="{$tableCellBackGround}">
		      					<fo:block> </fo:block>
		      				</fo:table-cell>
		      				<fo:table-cell border-width="thin" border-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="8pt" text-align="left" background-color="transparent">
		      					<fo:block>
		      						<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		      							<xslt:attribute name="xf:compat-id">id1837858
		      								<xslt:value-of select="generate-id(.)"/>
		      							</xslt:attribute>
		      							<xsl:choose>
		      								<xsl:when test="$vehicle.typeCode=17">
		      									<xsl:attribute name="src">
		      										<xslt:value-of select="$filledCheckbox"/>
		      									</xsl:attribute>
		      								</xsl:when>
		      							</xsl:choose>
		      						</fo:external-graphic>
		      						&#160;Pótkocsi, félpótkocsi 0,75 t-től 10 t megengedett legnagyobb össztömegig
		      					</fo:block>
		      				</fo:table-cell>
		      				<fo:table-cell border-width="thin" border-right-style="solid" border-color="rgb(0,0,0)" padding="2pt" padding-left="8pt" text-align="left" background-color="transparent">
		      					<fo:block>
		      						<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		      							<xslt:attribute name="xf:compat-id">id1837858
		      								<xslt:value-of select="generate-id(.)"/>
		      							</xslt:attribute>
		      							<xsl:choose>
		      								<xsl:when test="$vehicle.typeCode=25">
		      									<xsl:attribute name="src">
		      										<xslt:value-of select="$filledCheckbox"/>
		      									</xsl:attribute>
		      								</xsl:when>
		      							</xsl:choose>
		      						</fo:external-graphic>
		      						&#160;quad
		      					</fo:block>
		      				</fo:table-cell>
		      			</fo:table-row>                                         
		      		</fo:table-body>
		      	</fo:table>
		      	<!-- ================================== -->
		      	<!-- 3. Biztosított Jármű táblázat 4. sor (segédmotoros kerékpár...stb.) -->
		      	<fo:table table-layout="fixed" border-collapse="collapse">
		      		<fo:table-column column-width="proportional-column-width(23.000)" column-number="1"/>
		      		<fo:table-column column-width="proportional-column-width(55.000)" column-number="2"/>		 
		      		<fo:table-column column-width="proportional-column-width(22.000)" column-number="3"/>		      	
		      		<fo:table-body>
		      			<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
		      				<fo:table-cell border-width="thin" border-left-style="solid" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="{$tableCellBackGround}">
		      					<fo:block> </fo:block>
		      				</fo:table-cell>
		      				<fo:table-cell border-width="thin" border-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="8pt" text-align="left" background-color="transparent">
		      					<fo:block>
		      						<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		      							<xslt:attribute name="xf:compat-id">id1837858
		      								<xslt:value-of select="generate-id(.)"/>
		      							</xslt:attribute>
		      							<xsl:choose>
		      								<xsl:when test="$vehicle.typeCode=18">
		      									<xsl:attribute name="src">
		      										<xslt:value-of select="$filledCheckbox"/>
		      									</xsl:attribute>
		      								</xsl:when>
		      							</xsl:choose>
		      						</fo:external-graphic>
		      						&#160;Pótkocsi, félpótkocsi 10 t megengedett legnagyobb össztömeg felett
		      					</fo:block>
		      				</fo:table-cell>
		      				<fo:table-cell border-width="thin" border-right-style="solid" border-color="rgb(0,0,0)" padding="2pt" padding-left="2pt" text-align="left" background-color="transparent">
		      					<fo:block>
		      						<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		      							<xslt:attribute name="xf:compat-id">id1837858
		      								<xslt:value-of select="generate-id(.)"/>
		      							</xslt:attribute>
		      							<xsl:choose>
		      								<xsl:when test="$vehicle.typeCode=24">
		      									<xsl:attribute name="src">
		      										<xslt:value-of select="$filledCheckbox"/>
		      									</xsl:attribute>
		      								</xsl:when>
		      							</xsl:choose>
		      						</fo:external-graphic>
		      						&#160;segédmotoros kerékpár
		      					</fo:block>
		      				</fo:table-cell>
		      			</fo:table-row>                                         
		      		</fo:table-body>
		      	</fo:table>
		            <!-- ======================================================= -->
		            <!-- 3. Biztosított Jármű táblázat  6. sor (eurotax kód) -->			      
		            <fo:table table-layout="fixed" border-collapse="collapse">
		                  <fo:table-column column-width="proportional-column-width(23.000)" column-number="1"/>
		                  <fo:table-column column-width="proportional-column-width(77.000)" column-number="2"/>
		                  <fo:table-body>
		                  	<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
		                              <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		                                    <fo:block>
		                                          EUROTAX kód:
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:inline>
		                                                <xsl:value-of select="$vehicle.eurotaxCode"/>
		                                          </fo:inline>  
		                                    </fo:block>
		                              </fo:table-cell>
		                        </fo:table-row>
		                  </fo:table-body>
		            </fo:table>
		     <!-- ======================================================= -->
		     <!-- 3. Biztosított Jármű táblázat  7. sor (forgalmi rendszám/gyártmány) -->
		            <fo:table table-layout="fixed" border-collapse="collapse">
		                  <fo:table-column column-width="proportional-column-width(23.000)" column-number="1"/>
		                  <fo:table-column column-width="proportional-column-width(29.000)" column-number="2"/>
		                  <fo:table-column column-width="proportional-column-width(21.000)" column-number="3"/>
		                  <fo:table-column column-width="proportional-column-width(27.000)" column-number="4"/>
		                  <fo:table-body>
		                  	<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
		                              <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		                                    <fo:block>
		                                          Forgalmi rendszám:
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:inline>
		                                                <xsl:value-of select="$vehicle.registrationNumber"/>
		                                          </fo:inline>
		                                    </fo:block>
		                              </fo:table-cell> 
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		                                    <fo:block>
		                                          Gyártmány:
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:inline>
		                                                <xsl:value-of select="$vehicle.make"/>
		                                          </fo:inline>
		                                    </fo:block>
		                              </fo:table-cell> 
		                        </fo:table-row>
		                        <!-- ======================================================= -->
		                        <!-- 3. Biztosított Jármű táblázat  8. sor (Modell/típus) -->
		                  	<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
		                              <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		                                    <fo:block>
		                                          Modell:
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:inline>
		                                                <xsl:value-of select="$vehicle.model"/>
		                                          </fo:inline>
		                                    </fo:block>
		                              </fo:table-cell> 
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		                                    <fo:block>
		                                          Típus:
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:inline>
		                                                <xsl:value-of select="$vehicle.modelType"/>
		                                          </fo:inline>
		                                    </fo:block>
		                              </fo:table-cell> 
		                        </fo:table-row>
		                        <!-- ======================================================= -->
		                        <!-- 3. Biztosított Jármű táblázat  9. sor (Teljesítmény/Alvázszám) -->
		                  	<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
		                              <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		                                    <fo:block>
		                                          Teljesítmény:
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:inline>
		                                          	<xsl:choose>
		                                          		<xsl:when test="$vehicle.maximumNettoPower">
		                                          			<xsl:value-of select="$vehicle.maximumNettoPower"/> kW
		                                          		</xsl:when>
		                                          	</xsl:choose>		                                          	
		                                          </fo:inline>
		                                    </fo:block>
		                              </fo:table-cell> 
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		                                    <fo:block>
		                                          Alvázszám:
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:inline>
		                                                <xsl:value-of select="$vehicle.underCarriageNumber"/>
		                                          </fo:inline>
		                                    </fo:block>
		                              </fo:table-cell> 
		                        </fo:table-row>		                        
		                  </fo:table-body>
		            </fo:table>
		            <!-- ======================================================= -->
		            <!-- 3. Biztosított Jármű táblázat  10. sor (forgalmi engedély szám) -->			      
		            <fo:table table-layout="fixed" border-collapse="collapse">
		            	  <fo:table-column column-width="proportional-column-width(23.000)" column-number="1"/>
		                  <fo:table-column column-width="proportional-column-width(77.000)" column-number="2"/>
		                  <fo:table-body>
		                  	<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
		                              <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		                                    <fo:block>
		                                          Forgalmi engedély szám:
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:inline>
		                                                <xsl:value-of select="$vehicle.carDocumentsNumber"/>
		                                          </fo:inline>  
		                                    </fo:block>
		                              </fo:table-cell>
		                        </fo:table-row>
		                  </fo:table-body>
		            </fo:table>
		            <!-- ======================================================= -->
		            <!-- 3. Biztosított Jármű táblázat  11. sor (szállítható személyek száma/hengerűrtartalom) -->
		            <fo:table table-layout="fixed" border-collapse="collapse">
		                  <fo:table-column column-width="proportional-column-width(23.000)" column-number="1"/>
		                  <fo:table-column column-width="proportional-column-width(29.000)" column-number="2"/>
		                  <fo:table-column column-width="proportional-column-width(21.000)" column-number="3"/>
		                  <fo:table-column column-width="proportional-column-width(27.000)" column-number="4"/>
		                  <fo:table-body>
		                  	<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
		                              <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding-left="2pt" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		                                    <fo:block>
		                                          Szállítható személyek száma:
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:inline>
		                                                <xsl:value-of select="$vehicle.seatingCapacity"/>
		                                          </fo:inline>
		                                    </fo:block>
		                              </fo:table-cell> 
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		                                    <fo:block>
		                                          Hengerűrtartalom:
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:inline>
		                                          	<xsl:choose>
		                                          		<xsl:when test="$vehicle.cubicCapacity">
		                                          			<xsl:value-of select="$vehicle.cubicCapacity"/> ccm
		                                          		</xsl:when>
		                                          	</xsl:choose>		                                          			                                          
		                                          </fo:inline>
		                                    </fo:block>
		                              </fo:table-cell> 
		                        </fo:table-row>	                        
		                  </fo:table-body>
		            </fo:table>
		            <!-- ======================================================= -->
		            <!-- 3. Biztosított Jármű táblázat  12. sor (gyártási év... stb) -->
		            <fo:table table-layout="fixed" border-collapse="collapse">
		                  <fo:table-column column-width="proportional-column-width(23.000)" column-number="1"/>
		                  <fo:table-column column-width="proportional-column-width(14.000)" column-number="2"/>
		                  <fo:table-column column-width="proportional-column-width(15.000)" column-number="3"/>
		                  <fo:table-column column-width="proportional-column-width(21.000)" column-number="4"/>
		                  <fo:table-column column-width="proportional-column-width(16.000)" column-number="5"/>
		                  <fo:table-column column-width="proportional-column-width(11.000)" column-number="6"/>
		                  <fo:table-body>
		                  	<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
		                              <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding-left="2pt" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		                                    <fo:block>
		                                          Gyártás éve:
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:inline>
		                                          	<xsl:value-of select="$vehicle.yearOfProduction"/>
		                                          </fo:inline>
		                                    </fo:block>
		                              </fo:table-cell> 
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		                                    <fo:block>
		                                          Saját tömeg:
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:inline>
		                                          	<xsl:choose>
		                                          		<xsl:when test="$vehicle.ownWeight">
		                                          			<xsl:value-of select="$vehicle.ownWeight"/> kg
		                                          		</xsl:when>
		                                          	</xsl:choose>		                                          	
		                                          </fo:inline>
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-left-style="none" border-color="rgb(0,0,0)" padding-left="2pt" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		                                    <fo:block>
		                                          Megengedett tömeg:
		                                    </fo:block>
		                              </fo:table-cell>
		                              <fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="8pt" text-align="left" background-color="transparent">
		                                    <fo:block>
		                                          <fo:inline>
		                                          	<xsl:choose>
		                                          		<xsl:when test="$vehicle.maximumAllowedWeight">
		                                          			<xsl:value-of select="$vehicle.maximumAllowedWeight"/> kg
		                                          		</xsl:when>
		                                          	</xsl:choose>		                                          	
		                                          </fo:inline>
		                                    </fo:block>
		                              </fo:table-cell>
		                        </fo:table-row>	                        
		                  </fo:table-body>
		            </fo:table>
		      	<!-- ======================================================= -->
		      	<!-- 3. Biztosított Jármű táblázat  13. sor (tulajdonszerzés dátuma) -->			      
		      	<fo:table table-layout="fixed" border-collapse="collapse">
		      		<fo:table-column column-width="proportional-column-width(23.000)" column-number="1"/>
		      		<fo:table-column column-width="proportional-column-width(77.000)" column-number="2"/>
		      		<fo:table-body>
		      			<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
		      				<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		      					<fo:block>
		      						Tulajdonszerzés dátuma:
		      					</fo:block>
		      				</fo:table-cell>
		      				<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
		      					<fo:block>
		      						<fo:inline>
		      							<xsl:value-of select="$vehicle.dateOfPurchase"/>
		      						</fo:inline>  
		      					</fo:block>
		      				</fo:table-cell>
		      			</fo:table-row>
		      		</fo:table-body>
		      	</fo:table>
		      	<!-- ================================== -->
		      	<!-- 3. Biztosított Jármű táblázat 13. sor (Üzemeltetés jellege) -->
		      	<fo:table table-layout="fixed" border-collapse="collapse">
		      		<fo:table-column column-width="proportional-column-width(16.500)" column-number="1"/>
		      		<fo:table-column column-width="proportional-column-width(11.000)" column-number="2"/>
		      		<fo:table-column column-width="proportional-column-width(16.500)" column-number="3"/>
		      		<fo:table-column column-width="proportional-column-width(21.500)" column-number="4"/>
		      		<fo:table-column column-width="proportional-column-width(28.500)" column-number="5"/>
		      		<fo:table-column column-width="proportional-column-width(6.000)" column-number="6"/>
		      		<fo:table-body>
		      			<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
		      				<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		      					<fo:block>
		      						Üzemeltetés jellege:                                                             
		      					</fo:block>
		      				</fo:table-cell>
		      				<fo:table-cell border-width="thin" border-top-style="solid" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
		      					<fo:block>
		      						<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		      							<xslt:attribute name="xf:compat-id">id1837858
		      								<xslt:value-of select="generate-id(.)"/>
		      							</xslt:attribute>
		      							<xsl:choose>
		      								<xsl:when test="$vehicle.operationalModality='000'">
		      									<xsl:attribute name="src">
		      										<xslt:value-of select="$filledCheckbox"/>
		      									</xsl:attribute>
		      								</xsl:when>
		      							</xsl:choose>
		      						</fo:external-graphic>
		      						&#160;normál
		      					</fo:block>
		      				</fo:table-cell>
		      				<fo:table-cell border-width="thin" border-top-style="solid" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="transparent">
		      					<fo:block>
		      						<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		      							<xslt:attribute name="xf:compat-id">id1837858
		      								<xslt:value-of select="generate-id(.)"/>
		      							</xslt:attribute>
		      							<xsl:choose>
		      								<xsl:when test="$vehicle.operationalModality='003'">
		      									<xsl:attribute name="src">
		      										<xslt:value-of select="$filledCheckbox"/>
		      									</xsl:attribute>
		      								</xsl:when>
		      							</xsl:choose>
		      						</fo:external-graphic>
		      						&#160;reptéri kiszolgáló
		      					</fo:block>
		      				</fo:table-cell>
		      				<fo:table-cell border-width="thin" border-top-style="solid" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="transparent">
		      					<fo:block>
		      						<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		      							<xslt:attribute name="xf:compat-id">id1837858
		      								<xslt:value-of select="generate-id(.)"/>
		      							</xslt:attribute>
		      							<xsl:choose>
		      								<xsl:when test="$vehicle.operationalModality='007'">
		      									<xsl:attribute name="src">
		      										<xslt:value-of select="$filledCheckbox"/>
		      									</xsl:attribute>
		      								</xsl:when>
		      							</xsl:choose>
		      						</fo:external-graphic>
		      						&#160;nemzetközi árufuvarozó
		      					</fo:block>
		      				</fo:table-cell>
		      				<fo:table-cell border-width="thin" border-top-style="solid" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="transparent">
		      					<fo:block>
		      						<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		      							<xslt:attribute name="xf:compat-id">id1837858
		      								<xslt:value-of select="generate-id(.)"/>
		      							</xslt:attribute>
		      							<xsl:choose>
		      								<xsl:when test="$vehicle.operationalModality='002'">
		      									<xsl:attribute name="src">
		      										<xslt:value-of select="$filledCheckbox"/>
		      									</xsl:attribute>
		      								</xsl:when>
		      							</xsl:choose>
		      						</fo:external-graphic>
		      						&#160;megkülönböztető jelzést használó
		      					</fo:block>
		      				</fo:table-cell>
		      				<fo:table-cell border-width="thin" border-top-style="solid" border-right-style="solid" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="transparent">
		      					<fo:block>
		      						<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		      							<xslt:attribute name="xf:compat-id">id1837858
		      								<xslt:value-of select="generate-id(.)"/>
		      							</xslt:attribute>
		      							<xsl:choose>
		      								<xsl:when test="$vehicle.operationalModality='001'">
		      									<xsl:attribute name="src">
		      										<xslt:value-of select="$filledCheckbox"/>
		      									</xsl:attribute>
		      								</xsl:when>
		      							</xsl:choose>
		      						</fo:external-graphic>
		      						&#160;taxi
		      					</fo:block>
		      				</fo:table-cell>
		      			</fo:table-row>                                         
		      		</fo:table-body>
		      	</fo:table>
		      	<!-- ================================== -->
		      	<!-- 3. Biztosított Jármű táblázat 14. sor (veszélyes árut...stb.) -->
		      	<fo:table table-layout="fixed" border-collapse="collapse">
		      		<fo:table-column column-width="proportional-column-width(16.500)" column-number="1"/>
		      		<fo:table-column column-width="proportional-column-width(49.000)" column-number="2"/>
		      		<fo:table-column column-width="proportional-column-width(18.000)" column-number="3"/>
		      		<fo:table-column column-width="proportional-column-width(16.500)" column-number="4"/>
		      		<fo:table-body>
		      			<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
		      				<fo:table-cell border-width="thin" border-left-style="solid" border-bottom-style="solid" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
		      					<fo:block> </fo:block>
		      				</fo:table-cell>
		      				<fo:table-cell border-width="thin" border-bottom-style="solid" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
		      					<fo:block>
		      						<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		      							<xslt:attribute name="xf:compat-id">id1837858
		      								<xslt:value-of select="generate-id(.)"/>
		      							</xslt:attribute>
		      							<xsl:choose>
		      								<xsl:when test="$vehicle.operationalModality='004'">
		      									<xsl:attribute name="src">
		      										<xslt:value-of select="$filledCheckbox"/>
		      									</xsl:attribute>
		      								</xsl:when>
		      							</xsl:choose>
		      						</fo:external-graphic>
		      						&#160;veszélyes árut, tűz- és robbanásveszélyes anyagot szállító
		      					</fo:block>
		      				</fo:table-cell>
		      				<fo:table-cell border-width="thin" border-bottom-style="solid" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="transparent">
		      					<fo:block>
		      						<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		      							<xslt:attribute name="xf:compat-id">id1837858
		      								<xslt:value-of select="generate-id(.)"/>
		      							</xslt:attribute>
		      							<xsl:choose>
		      								<xsl:when test="$vehicle.operationalModality='006'">
		      									<xsl:attribute name="src">
		      										<xslt:value-of select="$filledCheckbox"/>
		      									</xsl:attribute>
		      								</xsl:when>
		      							</xsl:choose>
		      						</fo:external-graphic>
		      						&#160;napi bérletbe adott
		      					</fo:block>
		      				</fo:table-cell>
		      				<fo:table-cell border-width="thin" border-right-style="solid" border-bottom-style="solid" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="transparent">
		      					<fo:block>
		      						<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
		      							<xslt:attribute name="xf:compat-id">id1837858
		      								<xslt:value-of select="generate-id(.)"/>
		      							</xslt:attribute>
		      							<xsl:choose>
		      								<xsl:when test="$vehicle.operationalModality='005'">
		      									<xsl:attribute name="src">
		      										<xslt:value-of select="$filledCheckbox"/>
		      									</xsl:attribute>
		      								</xsl:when>
		      							</xsl:choose>
		      						</fo:external-graphic>
		      						&#160;versenyautó
		      					</fo:block>
		      				</fo:table-cell>
		      			</fo:table-row>                                         
		      		</fo:table-body>
		      	</fo:table>
		      </fo:block>
			<fo:block font-weight="normal" display-align="auto"> </fo:block>
			<fo:block font-weight="normal">
				<!-- ================================== -->
				<!-- 4. Díjszámítási adatok táblázat 1. sor -->			      
				<fo:table table-layout="fixed" border-collapse="collapse">
					<fo:table-column column-width="proportional-column-width(100.000)" column-number="1"/>
					<fo:table-body>
						<fo:table-row height="{$secondPageTableRowHeight}">
							<fo:table-cell display-align="center" border-width="thin" border-style="none" background-color="{$mkbbRed}" padding="2pt" color="rgb(255,255,255)" text-align="center">
								<fo:block>4. DÍJSZÁMÍTÁSI ADATOK</fo:block>
							</fo:table-cell>
						</fo:table-row>                                
					</fo:table-body>
				</fo:table>
				<!-- ======================================================= -->
				<!-- 4. Díjszámítási adatok táblázat 2. sor (díjfizetési gyakoriság) -->			      
				<fo:table table-layout="fixed" border-collapse="collapse">
					<fo:table-column column-width="proportional-column-width(20.000)" column-number="1"/>
					<fo:table-column column-width="proportional-column-width(20.000)" column-number="2"/>
					<fo:table-column column-width="proportional-column-width(20.000)" column-number="3"/>
					<fo:table-column column-width="proportional-column-width(20.000)" column-number="4"/>
					<fo:table-column column-width="proportional-column-width(20.000)" column-number="5"/>
					<fo:table-body>
						<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
							<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Díjfizetési gyakoriság:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
										<xslt:attribute name="xf:compat-id">id1837858
											<xslt:value-of select="generate-id(.)"/>
										</xslt:attribute>
										<xsl:choose>
											<xsl:when test="$paymentFrequency='49'">
												<xsl:attribute name="src">
													<xslt:value-of select="$filledCheckbox"/>
												</xsl:attribute>
											</xsl:when>
										</xsl:choose>
									</fo:external-graphic>
									&#160;negyedéves
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
										<xslt:attribute name="xf:compat-id">id1837858
											<xslt:value-of select="generate-id(.)"/>
										</xslt:attribute>
										<xsl:choose>
											<xsl:when test="$paymentFrequency='50'">
												<xsl:attribute name="src">
													<xslt:value-of select="$filledCheckbox"/>
												</xsl:attribute>
											</xsl:when>
										</xsl:choose>
									</fo:external-graphic>
									&#160;féléves
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
										<xslt:attribute name="xf:compat-id">id1837858
											<xslt:value-of select="generate-id(.)"/>
										</xslt:attribute>
										<xsl:choose>
											<xsl:when test="$paymentFrequency='51'">
												<xsl:attribute name="src">
													<xslt:value-of select="$filledCheckbox"/>
												</xsl:attribute>
											</xsl:when>
										</xsl:choose>
									</fo:external-graphic>
									&#160;éves
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
										<xslt:attribute name="xf:compat-id">id1837858
											<xslt:value-of select="generate-id(.)"/>
										</xslt:attribute>
										<xsl:choose>
											<xsl:when test="$durationType='2'">
												<xsl:attribute name="src">
													<xslt:value-of select="$filledCheckbox"/>
												</xsl:attribute>
											</xsl:when>
										</xsl:choose>
									</fo:external-graphic>
									&#160;egyszeri díjfizetés
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				<!-- ======================================================= -->
				<!-- 4. Díjszámítási adatok táblázat 3. sor (díjfizetés módja) -->			      
				<fo:table table-layout="fixed" border-collapse="collapse">
					<fo:table-column column-width="proportional-column-width(20.000)" column-number="1"/>
					<fo:table-column column-width="proportional-column-width(28.000)" column-number="2"/>
					<fo:table-column column-width="proportional-column-width(15.000)" column-number="3"/>
					<fo:table-column column-width="proportional-column-width(37.000)" column-number="4"/>
					<fo:table-body>
						<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
							<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Díjfizetés módja:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
										<xslt:attribute name="xf:compat-id">id1837858
											<xslt:value-of select="generate-id(.)"/>
										</xslt:attribute>
										<xsl:choose>
											<xsl:when test="$paymentMethod=1">
												<xsl:attribute name="src">
													<xslt:value-of select="$filledCheckbox"/>
												</xsl:attribute>
											</xsl:when>
										</xsl:choose>
									</fo:external-graphic>
									&#160;csoportos beszedési megbízás
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="8pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
										<xslt:attribute name="xf:compat-id">id1837858
											<xslt:value-of select="generate-id(.)"/>
										</xslt:attribute>
										<xsl:choose>
											<xsl:when test="$paymentMethod=0">
												<xsl:attribute name="src">
													<xslt:value-of select="$filledCheckbox"/>
												</xsl:attribute>
											</xsl:when>
										</xsl:choose>
									</fo:external-graphic>
									&#160;banki átutalás
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
										<xslt:attribute name="xf:compat-id">id1837858
											<xslt:value-of select="generate-id(.)"/>
										</xslt:attribute>
										<xsl:choose>
											<xsl:when test="$paymentMethod=2">
												<xsl:attribute name="src">
													<xslt:value-of select="$filledCheckbox"/>
												</xsl:attribute>
											</xsl:when>
										</xsl:choose>
									</fo:external-graphic>
									&#160;postai készpénz-átutalási megbízás (csekk)
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				<!-- ======================================================= -->
				<!-- 4. Díjszámítási adatok táblázat 4. és 5. sor (Ajánlat dátuma, Kockázat kezdete) -->			      
				<fo:table table-layout="fixed" border-collapse="collapse">
					<fo:table-column column-width="proportional-column-width(20.000)" column-number="1"/>
					<fo:table-column column-width="proportional-column-width(80.000)" column-number="2"/>
					<fo:table-body>
						<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
							<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Ajánlat dátuma:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:value-of select="$dateOfQuote"/>
									</fo:inline>  
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
							<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Kockázatviselés kezdete:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:value-of select="$startDate"/>
									</fo:inline>  
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				<!-- ======================================================= -->
				<!-- 4. Díjszámítási adatok táblázat 6. sor (A biztosítás tartama) -->			      
				<fo:table table-layout="fixed" border-collapse="collapse">
					<fo:table-column column-width="proportional-column-width(20.000)" column-number="1"/>
					<fo:table-column column-width="proportional-column-width(15.000)" column-number="2"/>
					<fo:table-column column-width="proportional-column-width(15.000)" column-number="3"/>
					<fo:table-column column-width="proportional-column-width(50.000)" column-number="4"/>
					<fo:table-body>
						<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
							<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									A biztosítás tartama:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
										<xslt:attribute name="xf:compat-id">id1837858
											<xslt:value-of select="generate-id(.)"/>
										</xslt:attribute>
										<xsl:choose>
											<xsl:when test="$durationType=1">
												<xsl:attribute name="src">
													<xslt:value-of select="$filledCheckbox"/>
												</xsl:attribute>
											</xsl:when>
										</xsl:choose>
									</fo:external-graphic>
									&#160;határozatlan
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
										<xslt:attribute name="xf:compat-id">id1837858
											<xslt:value-of select="generate-id(.)"/>
										</xslt:attribute>
										<xsl:choose>
											<xsl:when test="$durationType=2">
												<xsl:attribute name="src">
													<xslt:value-of select="$filledCheckbox"/>
												</xsl:attribute>
											</xsl:when>
										</xsl:choose>
									</fo:external-graphic>
									&#160;határozott
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>	</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				<!-- ======================================================= -->
				<!-- 4. Díjszámítási adatok táblázat 7. sor (Kockázat vége) -->			      
				<fo:table table-layout="fixed" border-collapse="collapse">
					<fo:table-column column-width="proportional-column-width(20.000)" column-number="1"/>
					<fo:table-column column-width="proportional-column-width(80.000)" column-number="2"/>
					<fo:table-body>
						<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
							<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Kockázatviselés vége:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:value-of select="$endDate"/>
									</fo:inline>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				<!-- ======================================================= -->
				<!-- 4. Díjszámítási adatok táblázat 8.sor (Alapdíj / gyártmány-teljesítmény szorzó) -->
				<fo:table table-layout="fixed" border-collapse="collapse">
					<fo:table-column column-width="proportional-column-width(20.000)" column-number="1"/>
					<fo:table-column column-width="proportional-column-width(30.000)" column-number="2"/>
					<fo:table-column column-width="proportional-column-width(32.000)" column-number="3"/>
					<fo:table-column column-width="proportional-column-width(18.000)" column-number="4"/>
					<fo:table-body>
						<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
							<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding-left="2pt" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Alapdíj:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:choose>
											<xsl:when test="$result.baseTariff">
												<xsl:value-of select="$result.baseTariff"/> Ft
											</xsl:when>
										</xsl:choose>										
									</fo:inline>						
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Gyártmány-teljesítmény szorzó:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:value-of select="$modfactor.vehicle.makePower"/>
									</fo:inline>
								</fo:block>
							</fo:table-cell> 
						</fo:table-row>	                        
					</fo:table-body>
				</fo:table>
				<!-- ======================================================= -->
				<!-- 4. Díjszámítási adatok táblázat 9.sor (Díjkedvezmények, pótdíjak szorzói) -->
				<fo:table table-layout="fixed" border-collapse="collapse">
					<fo:table-column column-width="proportional-column-width(50.000)" column-number="1"/>
					<fo:table-column column-width="proportional-column-width(32.000)" column-number="2"/>
					<fo:table-column column-width="proportional-column-width(18.000)" column-number="3"/>
					<fo:table-body>
						<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
							<fo:table-cell border-width="thin" font-weight="normal" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding-left="2pt" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Díjkedvezmények, pótdíjak szorzói:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Terület/Életkor szorzó:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:value-of select="$modfactor.partner.area"/>
									</fo:inline>
								</fo:block>
							</fo:table-cell> 
						</fo:table-row>	                        
					</fo:table-body>
				</fo:table>
				<!-- ======================================================= -->
				<!-- 4. Díjszámítási adatok táblázat 10. 11. 12. sor (Casco, csoportos, gyermek szorzók) -->
				<fo:table table-layout="fixed" border-collapse="collapse">
					<fo:table-column column-width="proportional-column-width(32.000)" column-number="1"/>
					<fo:table-column column-width="proportional-column-width(18.000)" column-number="2"/>
					<fo:table-column column-width="proportional-column-width(32.000)" column-number="3"/>
					<fo:table-column column-width="proportional-column-width(18.000)" column-number="4"/>
					<fo:table-body>
						<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
							<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding-left="2pt" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Hengerűrtartalom szorzó:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:value-of select="$modfactor.cubicCapacity"/>
									</fo:inline>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Gépjármű életkora szorzó:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:value-of select="$modfactor.vehicle.age"/>
									</fo:inline>
								</fo:block>
							</fo:table-cell> 
						</fo:table-row>
						<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
							<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding-left="2pt" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Díjfizetés gyakorisága szorzó:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:value-of select="$modfactor.paymentFrequency"/>
									</fo:inline>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Vezetői engedély kora szorzó:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:value-of select="$modfactor.partner.drivingLicense"/>
									</fo:inline>
								</fo:block>
							</fo:table-cell> 
						</fo:table-row>	
						<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
							<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding-left="2pt" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Induló bonus-malus besorolás:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:value-of select="$bonusMalus"/>
									</fo:inline>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Bonus-malus szorzó:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:value-of select="$modfactor.bonusMalus"/>
									</fo:inline>
								</fo:block>
							</fo:table-cell> 
						</fo:table-row>	
						<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
							<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding-left="2pt" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									E-mail kedvezmény:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:value-of select="$discount.email"/>
									</fo:inline>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Értékesítési partner kedvezmény:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:value-of select="$discount.marketingPartner"/>
									</fo:inline>
								</fo:block>
							</fo:table-cell> 
						</fo:table-row>		
						<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
							<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding-left="2pt" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Extra kármentességi kedvezmény:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:value-of select="$discount.extraClaimFree"/>
									</fo:inline>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Kampány kedvezmény:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:value-of select="$discount.campaign"/>
									</fo:inline>
								</fo:block>
							</fo:table-cell> 
						</fo:table-row>
						<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
							<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding-left="2pt" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Casco kedvezmény:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:choose>
											<xsl:when test="$discount.mkbbcasco">
												<xsl:value-of select="$discount.mkbbcasco"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:choose>
													<xsl:when test="$discount.nonmkbbcasco">
														<xsl:value-of select="$discount.nonmkbbcasco"/>	
													</xsl:when>
												</xsl:choose>																							
											</xsl:otherwise>
										</xsl:choose>
									</fo:inline>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Üzemeltetési pótdíj:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:value-of select="$surcharge.operationalModality"/>
									</fo:inline>
								</fo:block>
							</fo:table-cell> 
						</fo:table-row>					
					</fo:table-body>
				</fo:table>
				<!-- ======================================================= -->
				<!-- 4. Díjszámítási adatok táblázat 14. 15. sor (MKB Partner, Azonosító...) -->
				<fo:table table-layout="fixed" border-collapse="collapse">
					<fo:table-column column-width="proportional-column-width(50.000)" column-number="1"/>
					<fo:table-column column-width="proportional-column-width(50.000)" column-number="2"/>
					<fo:table-body>
						<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
							<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding-left="2pt" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Gyermek kedvezmény:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:value-of select="$discount.child"/>
									</fo:inline>
								</fo:block>
							</fo:table-cell> 
						</fo:table-row>	
						<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
							<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding-left="2pt" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Gyermek neve, születési dátuma:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:choose>
											<xsl:when test="$partner.child.name">
												<xsl:value-of select="$partner.child.name"/> , 
											</xsl:when>
										</xsl:choose>									
									</fo:inline>
									<fo:inline>
										<xsl:value-of select="$partner.child.dateOfBirth"/>
									</fo:inline>
									
								</fo:block>
							</fo:table-cell> 
						</fo:table-row>	
						<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
							<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding-left="2pt" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Köztisztviselő / Közalkalmazott / Tanár kedvezmény:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:choose>
											<xsl:when test="$discount.governmentEmployee">
												<xsl:value-of select="$discount.governmentEmployee"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:choose>
													<xsl:when test="$discount.publicEmployee">
														<xsl:value-of select="$discount.publicEmployee"/>	
													</xsl:when>
													<xsl:otherwise>
														<xsl:choose>
															<xsl:when test="$discount.teacher">
																<xsl:value-of select="$discount.teacher"/>	
															</xsl:when>
												        </xsl:choose>
													</xsl:otherwise>
												</xsl:choose>																							
											</xsl:otherwise>
										</xsl:choose>																			
									</fo:inline>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
							<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding-left="2pt" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Kisvállalkozói / Német-magyar keresk. kam. tagság kedvezmény:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:choose>
											<xsl:when test="$discount.entrepreneur">
												<xsl:value-of select="$discount.entrepreneur"/>
											</xsl:when>
											<xsl:otherwise>
												<xsl:choose>
													<xsl:when test="$discount.gerHunCCMember">
														<xsl:value-of select="$discount.gerHunCCMember"/>	
													</xsl:when>
												</xsl:choose>																							
											</xsl:otherwise>
										</xsl:choose>
									</fo:inline>
								</fo:block>
							</fo:table-cell> 
						</fo:table-row>									
						<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
							<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding-left="2pt" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Csoportos beszedési megbízás / banki átutalás kedvezmény:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:value-of select="$discount.paymentMethodSurcharge"/>
									</fo:inline>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
							<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding-left="2pt" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									MKB partner kedvezmény:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:value-of select="$discount.mkbPartner"/>
									</fo:inline>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
							<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding-left="2pt" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Azonosító szám partner kedvezményhez:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:value-of select="$mkbPartnerDiscountRef"/>
									</fo:inline>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
							<fo:table-cell border-width="thin" font-weight="bold" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Díjszámítási paraméterek együttes szorzata:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:value-of select="$result.totalMultiplier"/>
									</fo:inline>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row display-align="center" height="{$secondPageTableRowHeight}">
							<fo:table-cell border-width="thin" font-weight="bold" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Éves díj:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:choose>
											<xsl:when test="$result.yearlyPremium">
												<xsl:value-of select="$result.yearlyPremium"/> Ft
											</xsl:when>
										</xsl:choose>
									</fo:inline>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
			<fo:block break-after="page"> </fo:block>
			<!-- ================================= -->
			<!--  3. oldal -->
			<!-- Ajánlatszám táblázat -->
			<fo:block font-weight="normal" display-align="auto">
				<!-- ================================== -->
				<!-- Ajánlatszám táblázat --> 
				<fo:table table-layout="fixed" border-collapse="collapse">
					<fo:table-column column-width="proportional-column-width(50.000)" column-number="1"/>
					<fo:table-column column-width="proportional-column-width(16.000)" column-number="2"/>
					<fo:table-column column-width="proportional-column-width(34.000)" column-number="3"/>
					<fo:table-body>
						<fo:table-row height="{$quoteNumberTableHeight}">
							<fo:table-cell border-style="none">
								<fo:block> </fo:block>
							</fo:table-cell>
							<fo:table-cell display-align="center" border-width="thin" border-right-style="none" border-style="solid" background-color="{$tableCellBackGround}" padding="2pt" color="rgb(0,0,0)" text-align="left">
								<fo:block>Ajánlatszám:</fo:block>
							</fo:table-cell>
							<fo:table-cell font-weight="bold" display-align="center" border-width="thin" border-left-style="none" border-style="solid" padding="2pt" padding-left="10pt" text-align="left">
								<fo:block>
									<fo:inline>
										<xsl:value-of select="$quoteNumber"/>
									</fo:inline>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>                                
					</fo:table-body>
				</fo:table>
			</fo:block>
			<fo:block font-weight="normal" display-align="auto"> </fo:block>
			<fo:block font-weight="normal">
				<!-- ================================== -->
				<!-- 5. Díjfizetési adatok táblázat 1. sor -->			      
				<fo:table table-layout="fixed" border-collapse="collapse">
					<fo:table-column column-width="proportional-column-width(100.000)" column-number="1"/>
					<fo:table-body>
						<fo:table-row height="{$thirdPageTableRowHeight}">
							<fo:table-cell display-align="center" border-width="thin" border-style="none" background-color="{$mkbbRed}" padding="2pt" color="rgb(255,255,255)" text-align="center">
								<fo:block>5. DÍJFIZETÉSI ADATOK</fo:block>
							</fo:table-cell>
						</fo:table-row>                                
					</fo:table-body>
				</fo:table>
				<!-- ======================================================= -->
				<!-- 5. Díjfizetési adatok táblázat 2. sor -->		      
				<fo:table table-layout="fixed" border-collapse="collapse">
					<fo:table-column column-width="proportional-column-width(30.000)" column-number="1"/>
					<fo:table-column column-width="proportional-column-width(20.000)" column-number="2"/>
					<fo:table-column column-width="proportional-column-width(20.000)" column-number="3"/>
					<fo:table-column column-width="proportional-column-width(30.000)" column-number="4"/>
					<fo:table-body>
						<fo:table-row display-align="center" height="{$thirdPageTableRowHeight}">
							<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Halasztott díjfizetés:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="center" background-color="transparent">
								<fo:block>
									<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
										<xslt:attribute name="xf:compat-id">id1837858
											<xslt:value-of select="generate-id(.)"/>
										</xslt:attribute>
										<xsl:choose>
											<xsl:when test="$delayedPayment='true'">
												<xsl:attribute name="src">
													<xslt:value-of select="$filledCheckbox"/>
												</xsl:attribute>
											</xsl:when>
										</xsl:choose>
									</fo:external-graphic>
									&#160;igen&#160;&#160;
									<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
										<xslt:attribute name="xf:compat-id">id1837858
											<xslt:value-of select="generate-id(.)"/>
										</xslt:attribute>
										<xsl:choose>
											<xsl:when test="$delayedPayment='false'">
												<xsl:attribute name="src">
													<xslt:value-of select="$filledCheckbox"/>
												</xsl:attribute>
											</xsl:when>
										</xsl:choose>
									</fo:external-graphic>
									&#160;nem
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>Díjhalasztás:</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="center" background-color="transparent">
								<fo:block>
									<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
										<xslt:attribute name="xf:compat-id">id1837858
											<xslt:value-of select="generate-id(.)"/>
										</xslt:attribute>
										<xsl:choose>
											<xsl:when test="$delayedDays=30 and $delayedPayment='true'">
												<xsl:attribute name="src">
													<xslt:value-of select="$filledCheckbox"/>
												</xsl:attribute>
											</xsl:when>
										</xsl:choose>
									</fo:external-graphic>
									&#160;30 nap&#160;&#160;
									<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
										<xslt:attribute name="xf:compat-id">id1837858
											<xslt:value-of select="generate-id(.)"/>
										</xslt:attribute>
										<xsl:choose>
											<xsl:when test="$delayedDays=60 and $delayedPayment='true'">
												<xsl:attribute name="src">
													<xslt:value-of select="$filledCheckbox"/>
												</xsl:attribute>
											</xsl:when>
										</xsl:choose>
									</fo:external-graphic>
									&#160;60 nap&#160;&#160;
									<fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
										<xslt:attribute name="xf:compat-id">id1837858
											<xslt:value-of select="generate-id(.)"/>
										</xslt:attribute>
										<xsl:choose>
											<xsl:when test="$delayedDays=90 and $delayedPayment='true'">
												<xsl:attribute name="src">
													<xslt:value-of select="$filledCheckbox"/>
												</xsl:attribute>
											</xsl:when>
										</xsl:choose>
									</fo:external-graphic>
									&#160;90 nap
								</fo:block>
							</fo:table-cell>
						</fo:table-row>					
					</fo:table-body>
				</fo:table>
				<!-- ======================================================= -->
				<!-- 5. Díjfizetési adatok táblázat 3. és 4. sor (Első díj esedékesség, MABISZ díj kezdő dátuma) -->			      
				<fo:table table-layout="fixed" border-collapse="collapse">
					<fo:table-column column-width="proportional-column-width(30.000)" column-number="1"/>
					<fo:table-column column-width="proportional-column-width(70.000)" column-number="2"/>
					<fo:table-body>
						<fo:table-row display-align="center" height="{$thirdPageTableRowHeight}">
							<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Első díj esedékessége:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:value-of select="$dateOfFirstPremium"/>
									</fo:inline>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row display-align="center" height="{$thirdPageTableRowHeight}">
							<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Fedezetlenségi díj kezdő dátuma:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:value-of select="$startDateOfMABISZPremium"/>
									</fo:inline>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				<!-- ======================================================= -->
				<!-- 5. Díjfizetési adatok táblázat 5. és 6. sor (MABISZ díj összege, Tört időszak díja) -->			      
				<fo:table table-layout="fixed" border-collapse="collapse">
					<fo:table-column column-width="proportional-column-width(30.000)" column-number="1"/>
					<fo:table-column column-width="proportional-column-width(20.000)" column-number="2"/>
					<fo:table-column column-width="proportional-column-width(30.000)" column-number="3"/>
					<fo:table-column column-width="proportional-column-width(20.000)" column-number="4"/>
					<fo:table-body>
						<fo:table-row display-align="center" height="{$thirdPageTableRowHeight}">
							<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Fedezetlenségi díj összege:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:choose>
											<xsl:when test="$result.mabiszPremium">
												<xsl:value-of select="$result.mabiszPremium"/> Ft
											</xsl:when>
										</xsl:choose>									
									</fo:inline>
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Egy díjfizetési periódus díja:	
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:choose>
											<xsl:when test="$result.installmentPremium">
												<xsl:value-of select="$result.installmentPremium"/> Ft
											</xsl:when> 
										</xsl:choose>															
									</fo:inline>
								</fo:block>
							</fo:table-cell>					
						</fo:table-row>
					</fo:table-body>
				</fo:table>
				<!-- ======================================================= -->
				<!-- 5. Díjfizetési adatok táblázat 7. és 8. 9. sor (Bizonylat sorszáma, Díjfizető számlaszáma, Számlavezető bank neve) -->			      
				<fo:table table-layout="fixed" border-collapse="collapse">
					<fo:table-column column-width="proportional-column-width(30.000)" column-number="1"/>
					<fo:table-column column-width="proportional-column-width(70.000)" column-number="2"/>
					<fo:table-body>
						<fo:table-row display-align="center" height="{$thirdPageTableRowHeight}">
							<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Bizonylat sorszáma:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:value-of select="$warrantNumber"/>
									</fo:inline>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row display-align="center" height="{$thirdPageTableRowHeight}">
							<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Díjfizető számlaszáma:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:value-of select="$partner.accountNumber"/>
									</fo:inline>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row display-align="center" height="{$thirdPageTableRowHeight}">
							<fo:table-cell border-width="thin" border-style="solid" border-right-style="none" border-color="rgb(0,0,0)" padding="2pt" text-align="left" background-color="{$tableCellBackGround}">
								<fo:block>
									Számlavezető bank neve:
								</fo:block>
							</fo:table-cell>
							<fo:table-cell border-width="thin" border-style="solid" border-left-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="10pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:inline>
										<xsl:value-of select="$partner.bankName"/>
									</fo:inline>
								</fo:block>
							</fo:table-cell>
						</fo:table-row>
					</fo:table-body>
				</fo:table>
			</fo:block>
			<fo:block font-weight="normal" display-align="auto"> </fo:block>
			<fo:block font-weight="normal">
				<!-- ================================== -->
				<!-- 6. Nyilatkozatok 1. sor -->			      
				<fo:table table-layout="fixed" border-collapse="collapse">
					<fo:table-column column-width="proportional-column-width(100.000)" column-number="1"/>
					<fo:table-body>
						<fo:table-row height="{$thirdPageTableRowHeight}">
							<fo:table-cell display-align="center" border-width="thin" border-style="none" background-color="{$mkbbRed}" padding="2pt" color="rgb(255,255,255)" text-align="center">
								<fo:block>6. NYILATKOZATOK</fo:block>
							</fo:table-cell>
						</fo:table-row>   
						<fo:table-row display-align="center" padding-top="5pt">
							<fo:table-cell border-width="thin" border-style="solid" border-bottom-style="none" border-top-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="5pt" padding-top="10pt" text-align="left" background-color="transparent">								
								<fo:block>	
									<fo:list-block  provisional-label-separation="5pt" provisional-distance-between-starts="12pt">		                                                
										<fo:list-item padding-bottom="8pt">
											<fo:list-item-label end-indent="label-end()">
												<fo:block><fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
													<xslt:attribute name="xf:compat-id">id1837858
														<xslt:value-of select="generate-id(.)"/>
													</xslt:attribute>
													<xsl:choose>
														<xsl:when test="$declaration.itemsChecked=1">
															<xsl:attribute name="src">
																<xslt:value-of select="$filledCheckbox"/>
															</xsl:attribute>
														</xsl:when>
													</xsl:choose>
												</fo:external-graphic></fo:block>
											</fo:list-item-label>
											<fo:list-item-body start-indent="body-start()">
												<fo:block>A biztosítási ajánlaton szereplő adataimat ellenőriztem, azok a valóságnak megfelelnek.</fo:block>
											</fo:list-item-body>
										</fo:list-item>							
										<fo:list-item padding-bottom="8pt">
											<fo:list-item-label end-indent="label-end()">
												<fo:block><fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
													<xslt:attribute name="xf:compat-id">id1837858
														<xslt:value-of select="generate-id(.)"/>
													</xslt:attribute>
													<xsl:choose>
														<xsl:when test="$declaration.conditions=1">
															<xsl:attribute name="src">
																<xslt:value-of select="$filledCheckbox"/>
															</xsl:attribute>
														</xsl:when>
													</xsl:choose>
												</fo:external-graphic></fo:block>
											</fo:list-item-label>
											<fo:list-item-body start-indent="body-start()">
												<fo:block>Elolvastam és elfogadom a Biztosítási feltételekben 
													(2009. évi LXII. törvény a Kötelező gépjármű-felelősségbiztosításról) 
													és Ügyféltájékoztatóban foglaltakat.</fo:block>
											</fo:list-item-body>
										</fo:list-item>
										<fo:list-item padding-bottom="8pt">
											<fo:list-item-label end-indent="label-end()">
												<fo:block><fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
													<xslt:attribute name="xf:compat-id">id1837858
														<xslt:value-of select="generate-id(.)"/>
													</xslt:attribute>
													<xsl:choose>
														<xsl:when test="$declaration.customerReference=1">
															<xsl:attribute name="src">
																<xslt:value-of select="$filledCheckbox"/>
															</xsl:attribute>
														</xsl:when>
													</xsl:choose>
												</fo:external-graphic></fo:block>
											</fo:list-item-label>
											<fo:list-item-body start-indent="body-start()">
												<fo:block>Elolvastam és elfogadom a Biztosító Ügyféltájékoztatójában foglaltakat.</fo:block>
											</fo:list-item-body>
										</fo:list-item>
										<fo:list-item padding-bottom="8pt">
											<fo:list-item-label end-indent="label-end()">
												<fo:block><fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
													<xslt:attribute name="xf:compat-id">id1837858
														<xslt:value-of select="generate-id(.)"/>
													</xslt:attribute>
													<xsl:choose>
														<xsl:when test="$declaration.telesale=1">
															<xsl:attribute name="src">
																<xslt:value-of select="$filledCheckbox"/>
															</xsl:attribute>
														</xsl:when>
													</xsl:choose>
												</fo:external-graphic></fo:block>
											</fo:list-item-label>
											<fo:list-item-body start-indent="body-start()">
												<fo:block>Elolvastam és elfogadom a Biztosító távértékesítésre vonatkozó tájékoztatójában foglaltakat.</fo:block>
											</fo:list-item-body>
										</fo:list-item>	
										<fo:list-item padding-bottom="8pt">
											<fo:list-item-label end-indent="label-end()">
												<fo:block><fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
													<xslt:attribute name="xf:compat-id">id1837858
														<xslt:value-of select="generate-id(.)"/>
													</xslt:attribute>
													<xsl:choose>
														<xsl:when test="$declaration.serviceBefore14Days=1">
															<xsl:attribute name="src">
																<xslt:value-of select="$filledCheckbox"/>
															</xsl:attribute>
														</xsl:when>
													</xsl:choose>
												</fo:external-graphic></fo:block>
											</fo:list-item-label>
											<fo:list-item-body start-indent="body-start()">
												<fo:block>Hozzájárulok, hogy a Biztosító az elállásra nyitva álló 14 naptári nap letelte előtt 
													esedékes szolgáltatását teljesítse.</fo:block>
											</fo:list-item-body>
										</fo:list-item>	
										<fo:list-item padding-bottom="8pt">
											<fo:list-item-label end-indent="label-end()">
												<fo:block><fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
													<xslt:attribute name="xf:compat-id">id1837858
														<xslt:value-of select="generate-id(.)"/>
													</xslt:attribute>
													<xsl:choose>
														<xsl:when test="$declaration.email=1">
															<xsl:attribute name="src">
																<xslt:value-of select="$filledCheckbox"/>
															</xsl:attribute>
														</xsl:when>
													</xsl:choose>
												</fo:external-graphic></fo:block>
											</fo:list-item-label>
											<fo:list-item-body start-indent="body-start()">
												<fo:block>E-mail címem megadásával hozzájárulásomat adom ahhoz, hogy az MKB Általános Biztosító Zrt. a 
													megadott elérhetőségeken keresztül biztosítási szerzõdéseim megkötésével, kezelésével és 
													esetleges megszüntetésével, szolgáltatási, kárrendezési igényemmel, kármegelőzéssel, 
													valamint a következő biztosítási idõszakra várható díjról elektronikus úton információkat 
													küldjön és ebbõl a célból elérhetőségi adataimat kezelje. Tudomásul veszem, hogy amennyiben 
													az MKB Általános Biztosító Zrt. a biztosítási szerződés megkötésével, kezelésével és 
													esetleges megszüntetésével, szolgáltatási igényével kapcsolatos tájékoztatást vagy nyilatkozatot
													az elektronikus aláírásról szóló 2001. évi XXXV. Törvényben szabályozottnak megfelelően, fokozott 
													biztonságú elektronikus aláírással ellátva, elektronikus úton (e-mail) küldi meg részemre, 
													úgy az elektronikusan aláírt elektronikus dokumen-tumba foglalás az írásbeliség követelményének eleget tesz. </fo:block>
											</fo:list-item-body>
										</fo:list-item>											
									</fo:list-block>									
								</fo:block>					
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row display-align="center" padding-top="5pt">
							<fo:table-cell border-width="thin" border-style="solid" border-bottom-style="none" border-top-style="solid" border-color="rgb(0,0,0)" padding="2pt" padding-left="5pt" padding-top="10pt" text-align="left" background-color="transparent">								
								<fo:block padding-bottom="10pt" font-weight="bold" font-size="10pt">
									Nyilatkozat a személyes adatok átadásáról
								</fo:block>	
								<fo:block>	
									<fo:list-block  provisional-label-separation="5pt" provisional-distance-between-starts="12pt">		                                                
										<fo:list-item padding-bottom="5pt">
											<fo:list-item-label end-indent="label-end()">
												<fo:block><fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
													<xslt:attribute name="xf:compat-id">id1837858
														<xslt:value-of select="generate-id(.)"/>
													</xslt:attribute>
													<xsl:choose>
														<xsl:when test="$declaration.privacy1=1">
															<xsl:attribute name="src">
																<xslt:value-of select="$filledCheckbox"/>
															</xsl:attribute>
														</xsl:when>
													</xsl:choose>
												</fo:external-graphic></fo:block>
											</fo:list-item-label>
											<fo:list-item-body start-indent="body-start()">
												<fo:block>Kijelentem, hogy a biztosítási szerződési feltételekben és a külön tájékoztatóban elhelyezett, 
													a személyes adatok kezelésére vonatkozó tájékoztatást megismertem, tudomásul vettem. 
													Jelen nyilatkozataimat a tájékoztatás ismeretében teszem meg.</fo:block>
											</fo:list-item-body>
										</fo:list-item>
									</fo:list-block>									
								</fo:block>
								<fo:block>
									Alulírott szerződő/biztosított a jelen nyilatkozat aláírásával 
									ezúton nyilvánítom ki arra vonatkozó önkéntes és határozott hozzájárulásomat, 
									hogy az MKB Általános Biztosító Zrt.									
								</fo:block>						
							</fo:table-cell>
						</fo:table-row>						
						<fo:table-row display-align="center" padding-top="2pt">
							<fo:table-cell border-width="thin" border-style="solid" border-bottom-style="none" border-top-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="20pt" padding-top="5pt" text-align="left" background-color="transparent">
								<fo:block>
										<fo:list-block  provisional-label-separation="5pt" provisional-distance-between-starts="23pt">		                                                
											<fo:list-item padding-bottom="5pt">
												<fo:list-item-label end-indent="label-end()">
													<fo:block><fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
														<xslt:attribute name="xf:compat-id">id1837858
															<xslt:value-of select="generate-id(.)"/>
														</xslt:attribute>
														<xsl:choose>
															<xsl:when test="$declaration.privacy2a=1">
																<xsl:attribute name="src">
																	<xslt:value-of select="$filledCheckbox"/>
																</xsl:attribute>
															</xsl:when>
														</xsl:choose>
													</fo:external-graphic></fo:block>
												</fo:list-item-label>
												<fo:list-item-body start-indent="body-start()">
													<fo:block text-indent="-9px">a) statisztikai adatszolgáltatás céljából továbbítsa biztosítási titoknak minősülő adataimat 
														(személyes adataimat és a biztosítási szerződésre vonatkozó adatokat) a biztosító külföldi 
														tulajdonosának,</fo:block>
												</fo:list-item-body>
											</fo:list-item>
											<fo:list-item padding-bottom="5pt">
												<fo:list-item-label end-indent="label-end()">
													<fo:block><fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
														<xslt:attribute name="xf:compat-id">id1837858
															<xslt:value-of select="generate-id(.)"/>
														</xslt:attribute>
														<xsl:choose>
															<xsl:when test="$declaration.privacy2b=1">
																<xsl:attribute name="src">
																	<xslt:value-of select="$filledCheckbox"/>
																</xsl:attribute>
															</xsl:when>
														</xsl:choose>
													</fo:external-graphic></fo:block>
												</fo:list-item-label>
												<fo:list-item-body start-indent="body-start()">
													<fo:block text-indent="-9px">b) marketingkutatások céljából és egyéb marketingcélokból biztosítási titoknak minősülő adataimat (személyes adataimat, vagyoni helyzetemre 
														és a biztosítási szerződésemre vonatkozó adatokat) továbbítsa a piackutatási, illetve marketingtevékenységet végző szervezeteknek, amelyek 
														megbízási szerződésükben titoktartási kötelezettséget vállalnak, és amelyeket a piackutatásról szóló 1995. évi CXIX. 
														Törvény értelmében titoktartás kötelez,</fo:block>
												</fo:list-item-body>
											</fo:list-item>
											<fo:list-item padding-bottom="5pt">
												<fo:list-item-label end-indent="label-end()">
													<fo:block><fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
														<xslt:attribute name="xf:compat-id">id1837858
															<xslt:value-of select="generate-id(.)"/>
														</xslt:attribute>
														<xsl:choose>
															<xsl:when test="$declaration.privacy2c=1">
																<xsl:attribute name="src">
																	<xslt:value-of select="$filledCheckbox"/>
																</xsl:attribute>
															</xsl:when>
														</xsl:choose>
													</fo:external-graphic></fo:block>
												</fo:list-item-label>
												<fo:list-item-body start-indent="body-start()">
													<fo:block text-indent="-9px">c) nevemet és címemet az MKB Bank Zrt., az 
														MKB Nyugdíjpénztár és az MKB Egészségpénztár részére átadja abból a célból, 
														hogy szolgáltatásaikat részemre közvetlenül ajánlhassák fel,</fo:block>
												</fo:list-item-body>
											</fo:list-item>
											<fo:list-item padding-bottom="5pt">
												<fo:list-item-label end-indent="label-end()" padding-left="10pt">
													<fo:block><fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
														<xslt:attribute name="xf:compat-id">id1837858
															<xslt:value-of select="generate-id(.)"/>
														</xslt:attribute>
														<xsl:choose>
															<xsl:when test="$declaration.privacy2d=1">
																<xsl:attribute name="src">
																	<xslt:value-of select="$filledCheckbox"/>
																</xsl:attribute>
															</xsl:when>
														</xsl:choose>
													</fo:external-graphic></fo:block>
												</fo:list-item-label>
												<fo:list-item-body start-indent="body-start()">
													<fo:block text-indent="-9px">d) nevemet és címemet az MKB Életbiztosító Zrt. részére átadja abból a célból, 
														hogy szolgáltatásaikat részemre közvetlenül ajánlhassák fel,</fo:block>
												</fo:list-item-body>
											</fo:list-item>
											<fo:list-item padding-bottom="5pt">
												<fo:list-item-label end-indent="label-end()">
													<fo:block><fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
														<xslt:attribute name="xf:compat-id">id1837858
															<xslt:value-of select="generate-id(.)"/>
														</xslt:attribute>
														<xsl:choose>
															<xsl:when test="$declaration.privacy2e=1">
																<xsl:attribute name="src">
																	<xslt:value-of select="$filledCheckbox"/>
																</xsl:attribute>
															</xsl:when>
														</xsl:choose>
													</fo:external-graphic></fo:block>
												</fo:list-item-label>
												<fo:list-item-body start-indent="body-start()">
													<fo:block></fo:block>
													<fo:block text-indent="-9px">e) adatfeldolgozás céljából továbbítsa biztosítási titoknak minősülő adataimat (személyes adataimat és 
														a biztosítási szerzôdésre vonatkozó adatokat) a GaVI Gesellschaft für angewandte Versicherungs-Informatik mbH 
														(Székhely: Seckenheimer Str. 150 D-68165 Mannheim, BRD) adatfeldolgozó részére.</fo:block>
												</fo:list-item-body>
											</fo:list-item>
										</fo:list-block>										
								</fo:block>							
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row display-align="center" padding-top="2pt">
							<fo:table-cell border-width="thin" border-style="solid" border-bottom-style="none" border-top-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="5pt" padding-top="5pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:list-block  provisional-label-separation="5pt" provisional-distance-between-starts="12pt">		                                                
										<fo:list-item padding-bottom="5pt">
											<fo:list-item-label end-indent="label-end()">
												<fo:block><fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
													<xslt:attribute name="xf:compat-id">id1837858
														<xslt:value-of select="generate-id(.)"/>
													</xslt:attribute>
													<xsl:choose>
														<xsl:when test="$declaration.privacy3=1">
															<xsl:attribute name="src">
																<xslt:value-of select="$filledCheckbox"/>
															</xsl:attribute>
														</xsl:when>
													</xsl:choose>
												</fo:external-graphic></fo:block>
											</fo:list-item-label>
											<fo:list-item-body start-indent="body-start()">
												<fo:block>Hozzájárulok, hogy a Biztosító a személyes adataimat valamint a biztosított jármű adatait a 
													Közigazgatási és Elektronikus Közszolgáltatások Központi Hivatalának adatbázisában a jogszabályoknak 
													megfelelően ellenőrizze.</fo:block>
											</fo:list-item-body>
										</fo:list-item>
									</fo:list-block>									 
								</fo:block>
								<fo:block font-weight="normal" display-align="auto"> </fo:block>		
								<fo:block>Kelt: ........................................, .................... év ................................. hó .................... nap</fo:block>								
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row display-align="center" padding-top="2pt">
							<fo:table-cell border-width="thin" border-style="solid" border-bottom-style="none" border-top-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-right="40pt" padding-top="10pt" text-align="right" background-color="transparent">
								<fo:block>
									............................................................
								</fo:block>											
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row display-align="center">
							<fo:table-cell border-width="thin" border-style="solid" border-top-style="none" border-color="rgb(0,0,0)" padding="0pt" padding-right="55pt" padding-bottom="20pt" text-align="right" background-color="transparent">
								<fo:block>
									Szerződő/Biztosított aláírása
								</fo:block>											
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row display-align="center" padding-top="2pt">
							<fo:table-cell border-width="thin" border-style="solid" border-bottom-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="5pt" padding-top="10pt" text-align="left" background-color="transparent">
								<fo:block padding-bottom="10pt" font-weight="bold" font-size="10pt">
									Nyilatkozat kötelező bonus-malus besoroláshoz
								</fo:block>	
								<fo:block>
									Az ajánlaton szereplő gépjármű üzembentartója, a 2009. évi LXII. felhatalmazása értelmében a 19/2009. (X.9.) PM rendelet
									(továbbiakban: Rendelet) a bonus-malus rendszerre vonatkozó szabályai alapján az alábbi nyilatkozatot teszem, és egyben
									hozzájárulok ahhoz, hogy a nyilatkozatomban közölt adataimat a Biztosító beszerezze, ellenőrízze. 
								</fo:block>							
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row display-align="center" padding-top="2pt">
							<fo:table-cell border-width="thin" border-style="solid" border-bottom-style="none" border-top-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="20pt" padding-top="5pt" text-align="left" background-color="transparent">
								<fo:block>
									<fo:list-block  provisional-label-separation="8pt" provisional-distance-between-starts="12pt">		                                                
										<fo:list-item padding-bottom="5pt">
											<fo:list-item-label end-indent="label-end()">
												<fo:block><fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
													<xslt:attribute name="xf:compat-id">id1837858
														<xslt:value-of select="generate-id(.)"/>
													</xslt:attribute>
													<xsl:choose>
														<xsl:when test="$declaration.bonusmalus=0">
															<xsl:attribute name="src">
																<xslt:value-of select="$filledCheckbox"/>
															</xsl:attribute>
														</xsl:when>
													</xsl:choose>
												</fo:external-graphic></fo:block>
											</fo:list-item-label>
											<fo:list-item-body start-indent="body-start()">
												<fo:block>Kijelentem, hogy a mai napot megelőzően két éven belül nem voltam szerződője ugyanezen gépjármű-kategóriába 
													tartozó gépjármű felelősségbiztosításnak.</fo:block>
											</fo:list-item-body>
										</fo:list-item>
										<fo:list-item padding-bottom="5pt">
											<fo:list-item-label end-indent="label-end()">
												<fo:block><fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
													<xslt:attribute name="xf:compat-id">id1837858
														<xslt:value-of select="generate-id(.)"/>
													</xslt:attribute>
													<xsl:choose>
														<xsl:when test="$declaration.bonusmalus=1">
															<xsl:attribute name="src">
																<xslt:value-of select="$filledCheckbox"/>
															</xsl:attribute>
														</xsl:when>
													</xsl:choose>
												</fo:external-graphic></fo:block>
											</fo:list-item-label>
											<fo:list-item-body start-indent="body-start()">
												<fo:block>Kijelentem, hogy mai napot megelőzően két éven belül már voltam szerződője ugyanezen gépjármű-kategóriába tartozó
													gépjármű felelősségbiztosításnak és az a szerződésem érdekmúlás, felmondás vagy díjnemfizetés okkal megszűnt.
													Tudomásom van arról, hogy a Rendelet 7.§-a értelmében az évfordulós biztosítóváltás esetén a Biztosító az ajánlaton
													megadott nyilatkozatom alapján állapítja meg a rám vonatkozó bonus-malus fokozatot, nyilatkozat hiányában besorolásom
													A00. Azonban amennyiben az ajánlaton nem kerül rögzítésre az előző biztosító neve vagy előző szerződésem kötvényszáma
													úgy szerződésem besorolása M04. A Biztosító M04-be sorol abban az esetben is, ha az adatok megadásra kerültek, de ezek
													valótlanok vagy pontatlanok voltak.</fo:block>
											</fo:list-item-body>
										</fo:list-item>
										<fo:list-item padding-bottom="5pt">
											<fo:list-item-label end-indent="label-end()">
												<fo:block><fo:external-graphic src="{$blankCheckbox}" id="6E5C1WLK" content-width="7px">
													<xslt:attribute name="xf:compat-id">id1837858
														<xslt:value-of select="generate-id(.)"/>
													</xslt:attribute>
													<xsl:choose>
														<xsl:when test="$declaration.bonusmalus=2">
															<xsl:attribute name="src">
																<xslt:value-of select="$filledCheckbox"/>
															</xsl:attribute>
														</xsl:when>
													</xsl:choose>
												</fo:external-graphic></fo:block>
											</fo:list-item-label>
											<fo:list-item-body start-indent="body-start()">
												<fo:block>Kijelentem, hogy másik, azonos járműkategóriába tartozó járművemre már rendelkezem érvényes szerződéssel, de erről
													„kárelőzményi igazolást” nem vagyok köteles csatolni, mivel az ott elért bonus–malus fokozat jelen biztosításnál nem vehető
													figyelembe a besorolás így A00 lehet. 
													Párhuzamosan üzemeltetett gépjármű rendszáma: 
													<xsl:if test="$declaration.bonusmalus=2">
														<xsl:value-of select="$bonusmalus.registrationNumber"/>
													</xsl:if>
												</fo:block>
											</fo:list-item-body>
										</fo:list-item>
									</fo:list-block>										
								</fo:block>							
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row display-align="center" padding-top="2pt">
							<fo:table-cell border-width="thin" border-style="solid" border-bottom-style="none" border-top-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-left="5pt" padding-top="5pt" text-align="left" background-color="transparent">		
								<fo:block>Az ajánlat aláírásának kelte: ........................................, .................... év ................................. hó .................... nap</fo:block>								
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row display-align="center" padding-top="2pt">
							<fo:table-cell border-width="thin" border-style="solid" border-bottom-style="none" border-top-style="none" border-color="rgb(0,0,0)" padding="2pt" padding-right="40pt" padding-top="15pt" text-align="right" background-color="transparent">
								<fo:block>
									............................................................
								</fo:block>											
							</fo:table-cell>
						</fo:table-row>
						<fo:table-row display-align="center">
							<fo:table-cell border-width="thin" border-style="solid" border-top-style="none" border-color="rgb(0,0,0)" padding="0pt" padding-right="55pt" padding-bottom="20pt" text-align="right" background-color="transparent">
								<fo:block>
									Szerződő/Biztosított aláírása
								</fo:block>											
							</fo:table-cell>
						</fo:table-row>									
					</fo:table-body>
				</fo:table>				
			</fo:block>
            </fo:flow>
	</fo:page-sequence>
</fo:root>
</xsl:template>
<!-- ========================= NUMBER FORMATS ========================= -->
<!-- ========================= EXSLT TEMPLATES [str.padding.template.xsl] ========================= -->
<xslt:template name="str:padding">
<xslt:param name="length" select="0"/>
<xslt:param name="chars" select="' '"/>
<xslt:choose>
<xslt:when test="not($length) or not($chars)"/>
<xslt:otherwise>
<xslt:variable name="string" select="concat($chars, $chars, $chars, $chars, $chars,                                        $chars, $chars, $chars, $chars, $chars)"/>
<xslt:choose>
<xslt:when test="string-length($string) &gt;= $length">
<xslt:value-of select="substring($string, 1, $length)"/>
</xslt:when>
<xslt:otherwise>
<xslt:call-template name="str:padding">
<xslt:with-param name="length" select="$length"/>
<xslt:with-param name="chars" select="$string"/>
</xslt:call-template>
</xslt:otherwise>
</xslt:choose>
</xslt:otherwise>
</xslt:choose>
</xslt:template>
<!-- ========================= EXSLT TEMPLATES [date.format-date.template.xsl] ========================= -->
<xslt:template name="date:_get-days-elapsed">
<xslt:param name="month"/>
<xslt:choose>
<xslt:when test="$month = 1">0</xslt:when>
<xslt:when test="$month = 2">31</xslt:when>
<xslt:when test="$month = 3">59</xslt:when>
<xslt:when test="$month = 4">90</xslt:when>
<xslt:when test="$month = 5">120</xslt:when>
<xslt:when test="$month = 6">151</xslt:when>
<xslt:when test="$month = 7">181</xslt:when>
<xslt:when test="$month = 8">212</xslt:when>
<xslt:when test="$month = 9">243</xslt:when>
<xslt:when test="$month = 10">273</xslt:when>
<xslt:when test="$month = 11">304</xslt:when>
<xslt:when test="$month = 12">334</xslt:when>
<xslt:otherwise>365</xslt:otherwise>
</xslt:choose>
</xslt:template>
<xslt:template name="date:_get-month">
<xslt:param name="month"/>
<xslt:param name="lang-id" select="'en_US'"/>
<xslt:choose>
<xslt:when test="$lang-id = 'fr_FR'">
<xslt:choose>
<xslt:when test="$month = 1">Janvier;Jan</xslt:when>
<xslt:when test="$month = 2">Février;Fév</xslt:when>
<xslt:when test="$month = 3">Mars;Mar</xslt:when>
<xslt:when test="$month = 4">Avril;Avr</xslt:when>
<xslt:when test="$month = 5">Mai;Mai</xslt:when>
<xslt:when test="$month = 6">Juin;Jui</xslt:when>
<xslt:when test="$month = 7">Juillet;Juil</xslt:when>
<xslt:when test="$month = 8">Août;Aoû</xslt:when>
<xslt:when test="$month = 9">Septembre;Sep</xslt:when>
<xslt:when test="$month = 10">Octobre;Oct</xslt:when>
<xslt:when test="$month = 11">Novembre;Nov</xslt:when>
<xslt:when test="$month = 12">Décembre;Déc</xslt:when>
</xslt:choose>
</xslt:when>
<xslt:when test="$lang-id = 'de_AT' or $lang-id = 'de_DE' or $lang-id = 'de_CH'">
<xslt:choose>
<xslt:when test="$month = 1">Januar;Jan</xslt:when>
<xslt:when test="$month = 2">Februar;Feb</xslt:when>
<xslt:when test="$month = 3">März;Mär</xslt:when>
<xslt:when test="$month = 4">April;Apr</xslt:when>
<xslt:when test="$month = 5">Dürfen;Dür</xslt:when>
<xslt:when test="$month = 6">Juni;Jun</xslt:when>
<xslt:when test="$month = 7">Juli;Jul</xslt:when>
<xslt:when test="$month = 8">August;Aug</xslt:when>
<xslt:when test="$month = 9">September;Sep</xslt:when>
<xslt:when test="$month = 10">Oktober;Okt</xslt:when>
<xslt:when test="$month = 11">November;Nov</xslt:when>
<xslt:when test="$month = 12">Dezember;Dez</xslt:when>
</xslt:choose>
</xslt:when>
<xslt:when test="$lang-id = 'es_ES'">
<xslt:choose>
<xslt:when test="$month = 1">Enero;Ene</xslt:when>
<xslt:when test="$month = 2">Febrero;Feb</xslt:when>
<xslt:when test="$month = 3">Marzo;Mar</xslt:when>
<xslt:when test="$month = 4">Abril;Abr</xslt:when>
<xslt:when test="$month = 5">Mayo;May</xslt:when>
<xslt:when test="$month = 6">Junio;Jun</xslt:when>
<xslt:when test="$month = 7">Julio;Jul</xslt:when>
<xslt:when test="$month = 8">Agosto;Ago</xslt:when>
<xslt:when test="$month = 9">Septiembre;Sep</xslt:when>
<xslt:when test="$month = 10">Octubre;Oct</xslt:when>
<xslt:when test="$month = 11">Noviembre;Nov</xslt:when>
<xslt:when test="$month = 12">Diciembre;Dic</xslt:when>
</xslt:choose>
</xslt:when>
<xslt:otherwise>
<xslt:choose>
<xslt:when test="$month = 1">January;Jan</xslt:when>
<xslt:when test="$month = 2">February;Feb</xslt:when>
<xslt:when test="$month = 3">March;Mar</xslt:when>
<xslt:when test="$month = 4">April;Apr</xslt:when>
<xslt:when test="$month = 5">May;May</xslt:when>
<xslt:when test="$month = 6">June;Jun</xslt:when>
<xslt:when test="$month = 7">July;Jul</xslt:when>
<xslt:when test="$month = 8">August;Aug</xslt:when>
<xslt:when test="$month = 9">September;Sep</xslt:when>
<xslt:when test="$month = 10">October;Oct</xslt:when>
<xslt:when test="$month = 11">November;Nov</xslt:when>
<xslt:when test="$month = 12">December;Dec</xslt:when>
</xslt:choose>
</xslt:otherwise>
</xslt:choose>
</xslt:template>
<xslt:template name="date:_get-day">
<xslt:param name="day"/>
<xslt:param name="lang-id" select="'en_US'"/>
<xslt:choose>
<xslt:when test="$lang-id = 'fr_FR'">
<xslt:choose>
<xslt:when test="$day = 1">Dimanche;Dim</xslt:when>
<xslt:when test="$day = 2">Lundi;Lun</xslt:when>
<xslt:when test="$day = 3">Mardi;Mar</xslt:when>
<xslt:when test="$day = 4">Mercredi;Mer</xslt:when>
<xslt:when test="$day = 5">Jeudi;Jeu</xslt:when>
<xslt:when test="$day = 6">Vendredi;Ven</xslt:when>
<xslt:when test="$day = 7">Samedi;Sam</xslt:when>
</xslt:choose>
</xslt:when>
<xslt:when test="$lang-id = 'de_AT' or $lang-id = 'de_DE' or $lang-id = 'de_CH'">
<xslt:choose>
<xslt:when test="$day = 1">Sonntag;Son</xslt:when>
<xslt:when test="$day = 2">Montag;Mon</xslt:when>
<xslt:when test="$day = 3">Dienstag;Die</xslt:when>
<xslt:when test="$day = 4">Mittwoch;Mit</xslt:when>
<xslt:when test="$day = 5">Donnerstag;Don</xslt:when>
<xslt:when test="$day = 6">Freitag;Fre</xslt:when>
<xslt:when test="$day = 7">Samstag;Sam</xslt:when>
</xslt:choose>
</xslt:when>
<xslt:when test="$lang-id = 'es_ES'">
<xslt:choose>
<xslt:when test="$day = 1">Domingo;Dom</xslt:when>
<xslt:when test="$day = 2">Lunes;Lun</xslt:when>
<xslt:when test="$day = 3">Martes;Mar</xslt:when>
<xslt:when test="$day = 4">Miércoles;Mié</xslt:when>
<xslt:when test="$day = 5">Jueves;Jue</xslt:when>
<xslt:when test="$day = 6">Viernes;Vie</xslt:when>
<xslt:when test="$day = 7">Sábado;Sáb</xslt:when>
</xslt:choose>
</xslt:when>
<xslt:otherwise>
<xslt:choose>
<xslt:when test="$day = 1">Sunday;Sun</xslt:when>
<xslt:when test="$day = 2">Monday;Mon</xslt:when>
<xslt:when test="$day = 3">Tuesday;Tue</xslt:when>
<xslt:when test="$day = 4">Wednesday;Wed</xslt:when>
<xslt:when test="$day = 5">Thursday;Thu</xslt:when>
<xslt:when test="$day = 6">Friday;Fri</xslt:when>
<xslt:when test="$day = 7">Saturday;Sat</xslt:when>
</xslt:choose>
</xslt:otherwise>
</xslt:choose>
</xslt:template>
<xslt:template name="date:format-date">
<xslt:param name="date-time"/>
<xslt:param name="pattern"/>
<xslt:param name="lang-id"/>
<xslt:variable name="formatted">
<xslt:choose>
<xslt:when test="starts-with($date-time, '---')">
<xslt:call-template name="date:_format-date">
<xslt:with-param name="year" select="'NaN'"/>
<xslt:with-param name="month" select="'NaN'"/>
<xslt:with-param name="day" select="number(substring($date-time, 4, 2))"/>
<xslt:with-param name="pattern" select="$pattern"/>
<xslt:with-param name="lang-id" select="$lang-id"/>
</xslt:call-template>
</xslt:when>
<xslt:when test="starts-with($date-time, '--')">
<xslt:call-template name="date:_format-date">
<xslt:with-param name="year" select="'NaN'"/>
<xslt:with-param name="month" select="number(substring($date-time, 3, 2))"/>
<xslt:with-param name="day" select="number(substring($date-time, 6, 2))"/>
<xslt:with-param name="pattern" select="$pattern"/>
<xslt:with-param name="lang-id" select="$lang-id"/>
</xslt:call-template>
</xslt:when>
<xslt:otherwise>
<xslt:variable name="neg" select="starts-with($date-time, '-')"/>
<xslt:variable name="no-neg">
<xslt:choose>
<xslt:when test="$neg or starts-with($date-time, '+')">
<xslt:value-of select="substring($date-time, 2)"/>
</xslt:when>
<xslt:otherwise>
<xslt:value-of select="$date-time"/>
</xslt:otherwise>
</xslt:choose>
</xslt:variable>
<xslt:variable name="no-neg-length" select="string-length($no-neg)"/>
<xslt:variable name="timezone">
<xslt:choose>
<xslt:when test="substring($no-neg, $no-neg-length) = 'Z'">Z</xslt:when>
<xslt:otherwise>
<xslt:variable name="tz" select="substring($no-neg, $no-neg-length - 5)"/>
<xslt:if test="(substring($tz, 1, 1) = '-' or                                      substring($tz, 1, 1) = '+') and                                    substring($tz, 4, 1) = ':'">
<xslt:value-of select="$tz"/>
</xslt:if>
</xslt:otherwise>
</xslt:choose>
</xslt:variable>
<xslt:if test="not(string($timezone)) or                           $timezone = 'Z' or                            (substring($timezone, 2, 2) &lt;= 23 and                            substring($timezone, 5, 2) &lt;= 59)">
<xslt:variable name="dt" select="substring($no-neg, 1, $no-neg-length - string-length($timezone))"/>
<xslt:variable name="dt-length" select="string-length($dt)"/>
<xslt:choose>
<xslt:when test="substring($dt, 3, 1) = ':' and                                   substring($dt, 6, 1) = ':'">
<xslt:variable name="hour" select="substring($dt, 1, 2)"/>
<xslt:variable name="min" select="substring($dt, 4, 2)"/>
<xslt:variable name="sec" select="substring($dt, 7)"/>
<xslt:if test="$hour &lt;= 23 and                                    $min &lt;= 59 and                                    $sec &lt;= 60">
<xslt:call-template name="date:_format-date">
<xslt:with-param name="year" select="'NaN'"/>
<xslt:with-param name="month" select="'NaN'"/>
<xslt:with-param name="day" select="'NaN'"/>
<xslt:with-param name="hour" select="$hour"/>
<xslt:with-param name="minute" select="$min"/>
<xslt:with-param name="second" select="$sec"/>
<xslt:with-param name="timezone" select="$timezone"/>
<xslt:with-param name="pattern" select="$pattern"/>
<xslt:with-param name="lang-id" select="$lang-id"/>
</xslt:call-template>
</xslt:if>
</xslt:when>
<xslt:otherwise>
<xslt:variable name="year" select="substring($dt, 1, 4) * (($neg * -2) + 1)"/>
<xslt:choose>
<xslt:when test="not(number($year))"/>
<xslt:when test="$dt-length = 4">
<xslt:call-template name="date:_format-date">
<xslt:with-param name="year" select="$year"/>
<xslt:with-param name="timezone" select="$timezone"/>
<xslt:with-param name="pattern" select="$pattern"/>
<xslt:with-param name="lang-id" select="$lang-id"/>
</xslt:call-template>
</xslt:when>
<xslt:when test="substring($dt, 5, 1) = '-'">
<xslt:variable name="month" select="substring($dt, 6, 2)"/>
<xslt:choose>
<xslt:when test="not($month &lt;= 12)"/>
<xslt:when test="$dt-length = 7">
<xslt:call-template name="date:_format-date">
<xslt:with-param name="year" select="$year"/>
<xslt:with-param name="month" select="$month"/>
<xslt:with-param name="timezone" select="$timezone"/>
<xslt:with-param name="pattern" select="$pattern"/>
<xslt:with-param name="lang-id" select="$lang-id"/>
</xslt:call-template>
</xslt:when>
<xslt:when test="substring($dt, 8, 1) = '-'">
<xslt:variable name="day" select="substring($dt, 9, 2)"/>
<xslt:if test="$day &lt;= 31">
<xslt:choose>
<xslt:when test="$dt-length = 10">
<xslt:call-template name="date:_format-date">
<xslt:with-param name="year" select="$year"/>
<xslt:with-param name="month" select="$month"/>
<xslt:with-param name="day" select="$day"/>
<xslt:with-param name="timezone" select="$timezone"/>
<xslt:with-param name="pattern" select="$pattern"/>
<xslt:with-param name="lang-id" select="$lang-id"/>
</xslt:call-template>
</xslt:when>
<xslt:when test="substring($dt, 11, 1) = 'T' and                                                        substring($dt, 14, 1) = ':' and                                                        substring($dt, 17, 1) = ':'">
<xslt:variable name="hour" select="substring($dt, 12, 2)"/>
<xslt:variable name="min" select="substring($dt, 15, 2)"/>
<xslt:variable name="sec" select="substring($dt, 18)"/>
<xslt:if test="$hour &lt;= 23 and                                                         $min &lt;= 59 and                                                         $sec &lt;= 60">
<xslt:call-template name="date:_format-date">
<xslt:with-param name="year" select="$year"/>
<xslt:with-param name="month" select="$month"/>
<xslt:with-param name="day" select="$day"/>
<xslt:with-param name="hour" select="$hour"/>
<xslt:with-param name="minute" select="$min"/>
<xslt:with-param name="second" select="$sec"/>
<xslt:with-param name="timezone" select="$timezone"/>
<xslt:with-param name="pattern" select="$pattern"/>
<xslt:with-param name="lang-id" select="$lang-id"/>
</xslt:call-template>
</xslt:if>
</xslt:when>
</xslt:choose>
</xslt:if>
</xslt:when>
</xslt:choose>
</xslt:when>
<xslt:when test="string(number(substring($dt,5,1)))!='NaN'">
<xslt:variable name="month" select="substring($dt, 5, 2)"/>
<xslt:choose>
<xslt:when test="not($month &lt;= 12)"/>
<xslt:when test="$dt-length = 6">
<xslt:call-template name="date:_format-date">
<xslt:with-param name="year" select="$year"/>
<xslt:with-param name="month" select="$month"/>
<xslt:with-param name="timezone" select="$timezone"/>
<xslt:with-param name="pattern" select="$pattern"/>
<xslt:with-param name="lang-id" select="$lang-id"/>
</xslt:call-template>
</xslt:when>
<xslt:otherwise>
<xslt:variable name="day" select="substring($dt, 7, 2)"/>
<xslt:if test="$day &lt;= 31">
<xslt:choose>
<xslt:when test="$dt-length = 8">
<xslt:call-template name="date:_format-date">
<xslt:with-param name="year" select="$year"/>
<xslt:with-param name="month" select="$month"/>
<xslt:with-param name="day" select="$day"/>
<xslt:with-param name="timezone" select="$timezone"/>
<xslt:with-param name="pattern" select="$pattern"/>
<xslt:with-param name="lang-id" select="$lang-id"/>
</xslt:call-template>
</xslt:when>
<xslt:when test="substring($dt, 9, 1) = 'T' and  substring($dt, 12, 1) = ':' and  substring($dt, 15, 1) = ':'">
<xslt:variable name="hour" select="substring($dt, 10, 2)"/>
<xslt:variable name="min" select="substring($dt, 13, 2)"/>
<xslt:variable name="sec" select="substring($dt, 16)"/>
<xslt:if test="$hour &lt;= 23 and                                                         $min &lt;= 59 and                                                         $sec &lt;= 60">
<xslt:call-template name="date:_format-date">
<xslt:with-param name="year" select="$year"/>
<xslt:with-param name="month" select="$month"/>
<xslt:with-param name="day" select="$day"/>
<xslt:with-param name="hour" select="$hour"/>
<xslt:with-param name="minute" select="$min"/>
<xslt:with-param name="second" select="$sec"/>
<xslt:with-param name="timezone" select="$timezone"/>
<xslt:with-param name="pattern" select="$pattern"/>
<xslt:with-param name="lang-id" select="$lang-id"/>
</xslt:call-template>
</xslt:if>
</xslt:when>
</xslt:choose>
</xslt:if>
</xslt:otherwise>
</xslt:choose>
</xslt:when>
</xslt:choose>
</xslt:otherwise>
</xslt:choose>
</xslt:if>
</xslt:otherwise>
</xslt:choose>
</xslt:variable>
<xslt:value-of select="$formatted"/>
</xslt:template>
<xslt:template name="date:_format-date">
<xslt:param name="year"/>
<xslt:param name="month" select="1"/>
<xslt:param name="day" select="1"/>
<xslt:param name="hour" select="0"/>
<xslt:param name="minute" select="0"/>
<xslt:param name="second" select="0"/>
<xslt:param name="timezone" select="'Z'"/>
<xslt:param name="pattern" select="''"/>
<xslt:param name="lang-id" select="'en_US'"/>
<xslt:variable name="char" select="substring($pattern, 1, 1)"/>
<xslt:choose>
<xslt:when test="not($pattern)"/>
<xslt:when test="$char = &quot;'&quot;">
<xslt:choose>
<xslt:when test="substring($pattern, 2, 1) = &quot;'&quot;">
<xslt:text>'</xslt:text>
<xslt:call-template name="date:_format-date">
<xslt:with-param name="year" select="$year"/>
<xslt:with-param name="month" select="$month"/>
<xslt:with-param name="day" select="$day"/>
<xslt:with-param name="hour" select="$hour"/>
<xslt:with-param name="minute" select="$minute"/>
<xslt:with-param name="second" select="$second"/>
<xslt:with-param name="timezone" select="$timezone"/>
<xslt:with-param name="pattern" select="substring($pattern, 3)"/>
<xslt:with-param name="lang-id" select="$lang-id"/>
</xslt:call-template>
</xslt:when>
<xslt:otherwise>
<xslt:variable name="literal-value" select="substring-before(substring($pattern, 2), &quot;'&quot;)"/>
<xslt:value-of select="$literal-value"/>
<xslt:call-template name="date:_format-date">
<xslt:with-param name="year" select="$year"/>
<xslt:with-param name="month" select="$month"/>
<xslt:with-param name="day" select="$day"/>
<xslt:with-param name="hour" select="$hour"/>
<xslt:with-param name="minute" select="$minute"/>
<xslt:with-param name="second" select="$second"/>
<xslt:with-param name="timezone" select="$timezone"/>
<xslt:with-param name="pattern" select="substring($pattern, string-length($literal-value) + 2)"/>
<xslt:with-param name="lang-id" select="$lang-id"/>
</xslt:call-template>
</xslt:otherwise>
</xslt:choose>
</xslt:when>
<xslt:when test="not(contains('abcdefghjiklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ', $char))">
<xslt:value-of select="$char"/>
<xslt:call-template name="date:_format-date">
<xslt:with-param name="year" select="$year"/>
<xslt:with-param name="month" select="$month"/>
<xslt:with-param name="day" select="$day"/>
<xslt:with-param name="hour" select="$hour"/>
<xslt:with-param name="minute" select="$minute"/>
<xslt:with-param name="second" select="$second"/>
<xslt:with-param name="timezone" select="$timezone"/>
<xslt:with-param name="pattern" select="substring($pattern, 2)"/>
<xslt:with-param name="lang-id" select="$lang-id"/>
</xslt:call-template>
</xslt:when>
<xslt:when test="not(contains('GyMdhHmsSEDFwWakKz', $char))">
<xslt:message>
              Invalid token in format string: <xslt:value-of select="$char"/></xslt:message>
<xslt:call-template name="date:_format-date">
<xslt:with-param name="year" select="$year"/>
<xslt:with-param name="month" select="$month"/>
<xslt:with-param name="day" select="$day"/>
<xslt:with-param name="hour" select="$hour"/>
<xslt:with-param name="minute" select="$minute"/>
<xslt:with-param name="second" select="$second"/>
<xslt:with-param name="timezone" select="$timezone"/>
<xslt:with-param name="pattern" select="substring($pattern, 2)"/>
<xslt:with-param name="lang-id" select="$lang-id"/>
</xslt:call-template>
</xslt:when>
<xslt:otherwise>
<xslt:variable name="next-different-char" select="substring(translate($pattern, $char, ''), 1, 1)"/>
<xslt:variable name="pattern-length">
<xslt:choose>
<xslt:when test="$next-different-char">
<xslt:value-of select="string-length(substring-before($pattern, $next-different-char))"/>
</xslt:when>
<xslt:otherwise>
<xslt:value-of select="string-length($pattern)"/>
</xslt:otherwise>
</xslt:choose>
</xslt:variable>
<xslt:choose>
<xslt:when test="$char = 'G'">
<xslt:choose>
<xslt:when test="string($year) = 'NaN'"/>
<xslt:when test="$year &gt; 0">AD</xslt:when>
<xslt:otherwise>BC</xslt:otherwise>
</xslt:choose>
</xslt:when>
<xslt:when test="$char = 'M'">
<xslt:choose>
<xslt:when test="string($month) = 'NaN'"/>
<xslt:when test="$pattern-length &gt;= 3">
<xslt:variable name="month-node">
<xslt:call-template name="date:_get-month">
<xslt:with-param name="month" select="number($month)"/>
<xslt:with-param name="lang-id" select="$lang-id"/>
</xslt:call-template>
</xslt:variable>
<xslt:choose>
<xslt:when test="$pattern-length &gt;= 4">
<xslt:value-of select="substring-before(normalize-space($month-node), ';')"/>
</xslt:when>
<xslt:otherwise>
<xslt:value-of select="substring-after(normalize-space($month-node), ';')"/>
</xslt:otherwise>
</xslt:choose>
</xslt:when>
<xslt:when test="$pattern-length = 2">
<xslt:value-of select="format-number($month, '00')"/>
</xslt:when>
<xslt:when test="$pattern-length = 1">
<xslt:value-of select="format-number($month, '0')"/>
</xslt:when>
<xslt:otherwise>
<xslt:value-of select="$month"/>
</xslt:otherwise>
</xslt:choose>
</xslt:when>
<xslt:when test="$char = 'E'">
<xslt:choose>
<xslt:when test="string($year) = 'NaN' or string($month) = 'NaN' or string($day) = 'NaN'"/>
<xslt:otherwise>
<xslt:variable name="month-days">
<xslt:call-template name="date:_get-days-elapsed">
<xslt:with-param name="month" select="number($month)"/>
</xslt:call-template>
</xslt:variable>
<xslt:variable name="days" select="number($month-days) + $day + boolean(((not($year mod 4) and $year mod 100) or not($year mod 400)) and $month &gt; 2)"/>
<xslt:variable name="y-1" select="$year - 1"/>
<xslt:variable name="dow" select="(($y-1 + floor($y-1 div 4) -                                              floor($y-1 div 100) + floor($y-1 div 400) +                                              $days)                                              mod 7) + 1"/>
<xslt:variable name="day-node">
<xslt:call-template name="date:_get-day">
<xslt:with-param name="day" select="number($dow)"/>
<xslt:with-param name="lang-id" select="$lang-id"/>
</xslt:call-template>
</xslt:variable>
<xslt:choose>
<xslt:when test="$pattern-length &gt;= 4">
<xslt:value-of select="substring-before(normalize-space($day-node),';')"/>
</xslt:when>
<xslt:otherwise>
<xslt:value-of select="substring-after(normalize-space($day-node),';')"/>
</xslt:otherwise>
</xslt:choose>
</xslt:otherwise>
</xslt:choose>
</xslt:when>
<xslt:when test="$char = 'a'">
<xslt:choose>
<xslt:when test="string($hour) = 'NaN'"/>
<xslt:when test="$hour &gt;= 12">PM</xslt:when>
<xslt:otherwise>AM</xslt:otherwise>
</xslt:choose>
</xslt:when>
<xslt:when test="$char = 'z'">
<xslt:choose>
<xslt:when test="$timezone = 'Z'">UTC</xslt:when>
<xslt:otherwise>
                    UTC<xslt:value-of select="$timezone"/></xslt:otherwise>
</xslt:choose>
</xslt:when>
<xslt:otherwise>
<xslt:variable name="padding">
<xslt:choose>
<xslt:when test="$pattern-length &gt; 10">
<xslt:call-template name="str:padding">
<xslt:with-param name="length" select="$pattern-length"/>
<xslt:with-param name="chars" select="'0'"/>
</xslt:call-template>
</xslt:when>
<xslt:otherwise>
<xslt:value-of select="substring('0000000000', 1, $pattern-length)"/>
</xslt:otherwise>
</xslt:choose>
</xslt:variable>
<xslt:choose>
<xslt:when test="$char = 'y'">
<xslt:choose>
<xslt:when test="string($year) = 'NaN'"/>
<xslt:when test="$pattern-length &gt; 2">
<xslt:value-of select="format-number($year, $padding)"/>
</xslt:when>
<xslt:otherwise>
<xslt:value-of select="format-number(substring($year, string-length($year) - 1), $padding)"/>
</xslt:otherwise>
</xslt:choose>
</xslt:when>
<xslt:when test="$char = 'd'">
<xslt:choose>
<xslt:when test="string($day) = 'NaN'"/>
<xslt:otherwise>
<xslt:value-of select="format-number($day, $padding)"/>
</xslt:otherwise>
</xslt:choose>
</xslt:when>
<xslt:when test="$char = 'h'">
<xslt:variable name="h" select="$hour mod 12"/>
<xslt:choose>
<xslt:when test="string($hour) = 'NaN'"/>
<xslt:when test="$h">
<xslt:value-of select="format-number($h, $padding)"/>
</xslt:when>
<xslt:otherwise>
<xslt:value-of select="format-number(12, $padding)"/>
</xslt:otherwise>
</xslt:choose>
</xslt:when>
<xslt:when test="$char = 'H'">
<xslt:choose>
<xslt:when test="string($hour) = 'NaN'"/>
<xslt:otherwise>
<xslt:value-of select="format-number($hour, $padding)"/>
</xslt:otherwise>
</xslt:choose>
</xslt:when>
<xslt:when test="$char = 'k'">
<xslt:choose>
<xslt:when test="string($hour) = 'NaN'"/>
<xslt:when test="$hour">
<xslt:value-of select="format-number($hour, $padding)"/>
</xslt:when>
<xslt:otherwise>
<xslt:value-of select="format-number(24, $padding)"/>
</xslt:otherwise>
</xslt:choose>
</xslt:when>
<xslt:when test="$char = 'K'">
<xslt:choose>
<xslt:when test="string($hour) = 'NaN'"/>
<xslt:otherwise>
<xslt:value-of select="format-number($hour mod 12, $padding)"/>
</xslt:otherwise>
</xslt:choose>
</xslt:when>
<xslt:when test="$char = 'm'">
<xslt:choose>
<xslt:when test="string($minute) = 'NaN'"/>
<xslt:otherwise>
<xslt:value-of select="format-number($minute, $padding)"/>
</xslt:otherwise>
</xslt:choose>
</xslt:when>
<xslt:when test="$char = 's'">
<xslt:choose>
<xslt:when test="string($second) = 'NaN'"/>
<xslt:otherwise>
<xslt:value-of select="format-number($second, $padding)"/>
</xslt:otherwise>
</xslt:choose>
</xslt:when>
<xslt:when test="$char = 'S'">
<xslt:choose>
<xslt:when test="string($second) = 'NaN'"/>
<xslt:otherwise>
<xslt:value-of select="format-number(substring-after($second, '.'), $padding)"/>
</xslt:otherwise>
</xslt:choose>
</xslt:when>
<xslt:when test="$char = 'F'">
<xslt:choose>
<xslt:when test="string($day) = 'NaN'"/>
<xslt:otherwise>
<xslt:value-of select="floor($day div 7) + 1"/>
</xslt:otherwise>
</xslt:choose>
</xslt:when>
<xslt:when test="string($year) = 'NaN' or string($month) = 'NaN' or string($day) = 'NaN'"/>
<xslt:otherwise>
<xslt:variable name="month-days">
<xslt:call-template name="date:_get-days-elapsed">
<xslt:with-param name="month" select="number($month)"/>
</xslt:call-template>
</xslt:variable>
<xslt:variable name="days" select="number($month-days) + $day + boolean(((not($year mod 4) and $year mod 100) or not($year mod 400)) and $month &gt; 2)"/>
<xslt:choose>
<xslt:when test="$char = 'D'">
<xslt:value-of select="format-number($days, $padding)"/>
</xslt:when>
<xslt:when test="$char = 'w'">
<xslt:call-template name="date:_week-in-year">
<xslt:with-param name="days" select="$days"/>
<xslt:with-param name="year" select="$year"/>
</xslt:call-template>
</xslt:when>
<xslt:when test="$char = 'W'">
<xslt:variable name="y-1" select="$year - 1"/>
<xslt:variable name="day-of-week" select="(($y-1 + floor($y-1 div 4) -                                                   floor($y-1 div 100) + floor($y-1 div 400) +                                                   $days)                                                    mod 7) + 1"/>
<xslt:choose>
<xslt:when test="($day - $day-of-week) mod 7">
<xslt:value-of select="floor(($day - $day-of-week) div 7) + 2"/>
</xslt:when>
<xslt:otherwise>
<xslt:value-of select="floor(($day - $day-of-week) div 7) + 1"/>
</xslt:otherwise>
</xslt:choose>
</xslt:when>
</xslt:choose>
</xslt:otherwise>
</xslt:choose>
</xslt:otherwise>
</xslt:choose>
<xslt:call-template name="date:_format-date">
<xslt:with-param name="year" select="$year"/>
<xslt:with-param name="month" select="$month"/>
<xslt:with-param name="day" select="$day"/>
<xslt:with-param name="hour" select="$hour"/>
<xslt:with-param name="minute" select="$minute"/>
<xslt:with-param name="second" select="$second"/>
<xslt:with-param name="timezone" select="$timezone"/>
<xslt:with-param name="pattern" select="substring($pattern, $pattern-length + 1)"/>
<xslt:with-param name="lang-id" select="$lang-id"/>
</xslt:call-template>
</xslt:otherwise>
</xslt:choose>
</xslt:template>
<xslt:template name="date:_week-in-year">
<xslt:param name="days"/>
<xslt:param name="year"/>
<xslt:variable name="y-1" select="$year - 1"/>
<xslt:variable name="day-of-week" select="($y-1 + floor($y-1 div 4) -                           floor($y-1 div 100) + floor($y-1 div 400) +                           $days)                           mod 7"/>
<xslt:variable name="dow">
<xslt:choose>
<xslt:when test="$day-of-week">
<xslt:value-of select="$day-of-week"/>
</xslt:when>
<xslt:otherwise>7</xslt:otherwise>
</xslt:choose>
</xslt:variable>
<xslt:variable name="start-day" select="($days - $dow + 7) mod 7"/>
<xslt:variable name="week-number" select="floor(($days - $dow + 7) div 7)"/>
<xslt:choose>
<xslt:when test="$start-day &gt;= 4">
<xslt:value-of select="$week-number + 1"/>
</xslt:when>
<xslt:otherwise>
<xslt:choose>
<xslt:when test="not($week-number)">
<xslt:call-template name="date:_week-in-year">
<xslt:with-param name="days" select="365 + ((not($y-1 mod 4) and $y-1 mod 100) or not($y-1 mod 400))"/>
<xslt:with-param name="year" select="$y-1"/>
</xslt:call-template>
</xslt:when>
<xslt:otherwise>
<xslt:value-of select="$week-number"/>
</xslt:otherwise>
</xslt:choose>
</xslt:otherwise>
</xslt:choose>
</xslt:template>
<!-- ========================= END OF STYLESHEET ========================= -->
</xslt:stylesheet>
