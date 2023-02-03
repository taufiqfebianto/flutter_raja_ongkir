// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_raja_ongkir/models/province_response_model.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/city_response_model.dart';
import '../models/cost_request_model.dart';
import '../models/cost_response_model.dart';
import 'bloc/app_bloc.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  late ProvinceResponseModel provinceModel;
  late CityResponseModel cityModel;
  late CostResponseModel costModel;
  late CostRequestModel costReqModel;

  final TextEditingController _originController = TextEditingController();
  final TextEditingController _destinationController = TextEditingController();

  String originProvince = 'originProvince';
  String originProvinceId = '';
  String originCity = 'originCity';
  String originCityId = '';

  String destinationProvince = 'destinationProvince';
  String destinationProvinceId = '';
  String destinationCity = 'destinationCity';
  String destinationCityId = '';

  AppBloc? bloc;

  @override
  void initState() {
    bloc = BlocProvider.of<AppBloc>(context);
    bloc!.add(const GetProvinceEvent());
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(
          message,
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontWeight: FontWeight.w300,
            fontSize: 16.0,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        behavior: SnackBarBehavior.floating,
        elevation: 1.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
    );
  }

  _showProvinceOrigin() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Color(0xffd9d9d9),
        builder: (BuildContext builder) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            child: ListView.builder(
              itemCount: provinceModel.rajaongkir!.results!.length,
              itemBuilder: ((context, int index) {
                return ListTile(
                  title: InkWell(
                      onTap: () {
                        setState(() {
                          originProvinceId = provinceModel
                              .rajaongkir!.results![index].provinceId!;
                        });

                        bloc!.add(GetCityOriginEvent(originProvinceId));

                        Navigator.pop(context);
                      },
                      child: Text(
                          provinceModel.rajaongkir!.results![index].province!)),
                );
              }),
            ),
          );
        });
  }

  _showCityOrigin() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Color(0xffd9d9d9),
        builder: (BuildContext builder) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            child: ListView.builder(
              itemCount: cityModel.rajaongkir!.results!.length,
              itemBuilder: ((context, int index) {
                return ListTile(
                  title: InkWell(
                      onTap: () {
                        setState(() {
                          originCityId =
                              cityModel.rajaongkir!.results![index].cityId!;
                          _originController.text =
                              '${cityModel.rajaongkir!.results![index].province!} - ${cityModel.rajaongkir!.results![index].type! == 'Kabupaten' ? 'Kab. ' : 'Kota '}${cityModel.rajaongkir!.results![index].cityName!}';
                        });
                        Navigator.pop(context);
                      },
                      child: Text(
                          '${cityModel.rajaongkir!.results![index].type!} ${cityModel.rajaongkir!.results![index].cityName}')),
                );
              }),
            ),
          );
        });
  }

  _showProvinceDestination() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Color(0xffd9d9d9),
        builder: (BuildContext builder) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            child: ListView.builder(
              itemCount: provinceModel.rajaongkir!.results!.length,
              itemBuilder: ((context, int index) {
                return ListTile(
                  title: InkWell(
                      onTap: () {
                        setState(() {
                          destinationProvinceId = provinceModel
                              .rajaongkir!.results![index].provinceId!;
                        });
                        bloc!.add(
                            GetCityDestinationEvent(destinationProvinceId));
                        Navigator.pop(context);
                      },
                      child: Text(
                          provinceModel.rajaongkir!.results![index].province!)),
                );
              }),
            ),
          );
        });
  }

  _showCityDestination() {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        backgroundColor: Color(0xffd9d9d9),
        builder: (BuildContext builder) {
          return SizedBox(
            height: MediaQuery.of(context).size.height / 2.5,
            child: ListView.builder(
              itemCount: cityModel.rajaongkir!.results!.length,
              itemBuilder: ((context, int index) {
                return ListTile(
                  title: InkWell(
                      onTap: () {
                        setState(() {
                          destinationCityId =
                              cityModel.rajaongkir!.results![index].cityId!;
                          _destinationController.text =
                              '${cityModel.rajaongkir!.results![index].province!} - ${cityModel.rajaongkir!.results![index].type! == 'Kabupaten' ? 'Kab. ' : 'Kota '}${cityModel.rajaongkir!.results![index].cityName!}';
                        });
                        Navigator.pop(context);
                      },
                      child: Text(
                          '${cityModel.rajaongkir!.results![index].type!} ${cityModel.rajaongkir!.results![index].cityName}')),
                );
              }),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppBloc, AppState>(
      listener: ((context, state) {
        if (state is GetProvinceSuccessState) {
          provinceModel = state.model;
        }
        if (state is GetCityOriginSuccessState) {
          cityModel = state.model;

          _showCityOrigin();
        }
        if (state is GetCityDestinationSuccessState) {
          cityModel = state.model;

          _showCityDestination();
        }
        if (state is CheckCostSuccessState) {}
        if (state is FailedState) {
          _showSnackBar(state.message!);
        }
      }),
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            shadowColor: Colors.transparent,
            backgroundColor: Color(0xffd9d9d9),
          ),
          body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[Color(0xffd9d9d9), Color(0xffffffff)],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  Column(
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.place_rounded,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Asal',
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: _showProvinceOrigin,
                            child: TextFormField(
                              controller: _originController,
                              enabled: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.pin_drop_rounded,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text(
                                'Tujuan',
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: _showProvinceDestination,
                            child: TextFormField(
                              controller: _destinationController,
                              enabled: false,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            'Berat (Kilogramr)',
                            style: GoogleFonts.lato(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.amber),
                                child: IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.arrow_left_rounded,
                                    size: 30,
                                  ),
                                ),
                              ),
                              Text(
                                '0',
                                style: GoogleFonts.lato(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20),
                              ),
                              Container(
                                height: 40,
                                width: 40,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.amber),
                                child: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      costReqModel = CostRequestModel();
                                      costReqModel.courier = 'jne';
                                      costReqModel.origin = originCityId;
                                      costReqModel.destination =
                                          destinationCityId;
                                      costReqModel.weight = 1000;
                                      costReqModel.iosKey = "IOS1000";
                                    });

                                    bloc!.add(CheckCostEvent(costReqModel));
                                  },
                                  icon: Icon(
                                    Icons.arrow_right_rounded,
                                    size: 30,
                                  ),
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: 3,
                      itemBuilder: ((context, int index) {
                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.black38,
                          ),
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.symmetric(vertical: 5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Icon(Icons.logo_dev),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('service'),
                                  Text('description'),
                                  Text('estimated'),
                                ],
                              ),
                              Text('price'),
                            ],
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
