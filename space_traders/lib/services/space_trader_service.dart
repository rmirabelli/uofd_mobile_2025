import 'package:http/http.dart' as http;
import 'package:space_traders/models/contract.dart';
import 'package:space_traders/models/shipyard.dart';
import 'dart:convert';
import '../models/agent_information.dart';
import '../models/waypoint.dart';

class SpaceTraderService {
  final String jwt =
      "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZGVudGlmaWVyIjoiVU9GRF9NRV9UT08iLCJ2ZXJzaW9uIjoidjIuMy4wIiwicmVzZXRfZGF0ZSI6IjIwMjUtMTEtMTYiLCJpYXQiOjE3NjM1MTUzMzcsInN1YiI6ImFnZW50LXRva2VuIn0.Zw9MfdD9eF00d7OWtL2Q6QST9NkjJ-9xy066XRI3wPtR3MFPRa2kWKkInJh_iY7DncNtDhmgTDnJfZYU9MW_4Fcp-ijOdqUutVMf4khDjROwdNzh7IuZfQwoeR4z-SMarcIk9PBRgkcw2ZcSY2PuNYZxC1Im-GuS-_KVgAsu1ggTleiB0dkzrPp59Zq9a9PJqyQUceKmuZcCyuiPgHtPOOM83JE9m9bV5O9MepuY7LePZ6RUk6iTV5UZEhk7lnx1LxVH1T4PubmDdmIjjvDr6C2JXPnPM3F0hszlidTo5jJkWhnJBJepvjZ6hE9xFgAKGgDQHpc433b_KINAD9tYsdnMxaS5OOK2_poV7lpZCuWwp4HpPFJMD8Xr-bevDGNnIUL1dOEXU-4vxSsC4_5wwKmth2RnvfRHg8zCuPQ_BLVhhck7bLQUebZ6Udbsin3d_CUq-2fnkDiOho26IX61OyGmzZVEH6T5_4rxD9tgcjFaZPE4cUMWX2456Ip9VOWFddAJ6_mgaDnKk6KeOj2lX3NmusaWrfrZBKFy22I1iqRw7IwxFE_47H1iyTExcvtIST-VrBmx2_J8WRicL-yUacWIl0SyeyhZC7-SN_uvGFcamOWOVKzsUbCe264cluIOgE3HazcGodOXhY0YOmmNzfF9vwHdKkFevUHjOtlp_ew";
  final jwt3 =
      "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZGVudGlmaWVyIjoiRkxVVFRFUlBST0YiLCJ2ZXJzaW9uIjoidjIuMy4wIiwicmVzZXRfZGF0ZSI6IjIwMjUtMTEtMTYiLCJpYXQiOjE3NjM2MDU1ODIsInN1YiI6ImFnZW50LXRva2VuIn0.vcstqMnnsJ8Ba0_NrJRvhd37Mal-xHVC56Qq8PjYHIKHMNvwuDB2itt1lwdHiRuQwvihbpTHMljWCB_Na-o8CJ4_TkWI3_EKFUyvsrtSkIVjDjrJep569EgyDZ8UrbkMgsV_WxE-UF3lgz2T_tYsaxk1LaIHRyjv-ae9HxPAWAmOwSq57AZG2W-a3u4yPmRqxxqQjRCQcNX_MaqAI2nCu16SkygLFI1M-rlOEZ96e1_gHVlJXIBiXJ0AmX-26HJumHWl9aNqiwuKCFYQmMmhW2AQzjXQdY1nQWxl6cCYhVcSiWGh8SrAJaRUL25QI3On8o_Usxo-KtSF_ZgPqi1ixsq5bRZhqUX8g1pLG9EXQbKvQGWis8aOEcyIx-ko5x9-gfNR-bLLx2T7SNYVHK70PjDNoOnI09vxq2tO79OxCDJR1FLDOaQKX2cLgXbCTPRAcqLOxsSYj-aBo-kfKYpPjfUVMBc9Iz_OYTlygLm-vcnzR2MRGpnBGBT0Qlm3PCPSl1hP3fwStF5lSUmej3llT5FPTngZ0jdnxyiiTylvPVQlEfa7pUlVvOtq6b9ahOgi4_m0rJiWNhpqD3f6qoRuYiog6HQvzLcbRUE6LUmZr1LHd1DOTNv8LZqgB_lmP2elKkg7T0uS0r3zOF1Z-QXo-spCqffEqeunKHro6lB7Kio";
  final jwt2 =
      "eyJhbGciOiJSUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZGVudGlmaWVyIjoiU0VDUkVUX0FHRU5UIiwidmVyc2lvbiI6InYyLjMuMCIsInJlc2V0X2RhdGUiOiIyMDI1LTExLTE2IiwiaWF0IjoxNzYzNTk2MjA2LCJzdWIiOiJhZ2VudC10b2tlbiJ9.M8XYgAPanrOYAuw59waLq1MeJun8EN__7raZXUew0FQWDv2n2mQWWjk330mXwqhSpZmPlxmO1Ea8Tl6MDPRi8LXZ37ydhFoAlSAu3JYvASGeIb6ddUKMu8KZyUX_qlux5PFWh6WL_4i87G0H2Wnx3yukkMPn11Z8i88_bgRjcAEXBryfWSZ97ifchPX34iLqHzx7Damz3NkjETp8cvr5gwksbv0eOZo9nanAVkNV26Glor3A3ocoWS3ecue82Qnp3HPwzKiie3xjuiYD6JjNBc1xgb6sK0ZKoGxM4_npbQToRfrEfW4rqR9yR6Pxm0_XkMc-EtglrFRxPFs7y2tYO_9guc9lj_m3UreA3GE4yYqznXSntBwgoN2ZT9bgHa3nCV-TP0Ghywrv3gBAOcQelpd1SQqSXqN_PO15s_26SJ7AZPGe5w5ldBqkdOKgHTTxrQHrkl8HTRPYDcrR09uyAaVyZjwJ0Fy0EcgCU_kc2QfLFzv3LV3cMlvqc4FzoTCVUiPMN1xAMd-8rRmQd3O97Scsh-OzHQfUL3v8gDU0cGNhZlO99zJU841LhEPeeLDdqQ5z0wuwSqzgD7yUSKbKb8QuUzRwJtYGGIVWKIbxQKu2t35u_9pQZ5tTg7l0bz0fNiZatFgMGyf08pR610WlaKknqk7MMo4VFkXedx-2Q5g";

  Map<String, String> get headers => {
    "Content-Type": "application/json",
    "Accept": "application/json",
    "Authorization": "Bearer $jwt",
  };

  Future<AgentInformation> getAgentData() {
    return http.get(Uri.parse("https://api.spacetraders.io/v2/my/agent"), headers: headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final json = JsonDecoder().convert(response.body) as Map<String, dynamic>;
        final data = json['data'] as Map<String, dynamic>;
        final agentInformation = AgentInformation.fromJson(data);
        return agentInformation;
      }
      throw (response.body);
    });
  }

  Future<Waypoint> getStartingLocation(AgentInformation agentInformation) {
    final splits = agentInformation.headquarters.split('-');
    final system = '${splits[0]}-${splits[1]}';
    final waypoint = agentInformation.headquarters;
    return http.get(Uri.parse('https://api.spacetraders.io/v2/systems/$system/waypoints/$waypoint')).then((response) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final json = JsonDecoder().convert(response.body) as Map<String, dynamic>;
        final data = json['data'] as Map<String, dynamic>;
        final waypoint = Waypoint.fromJson(data);
        return waypoint;
      }
      throw (response.body);
    });
  }

  Future<List<Contract>> getContracts() {
    return http.get(Uri.parse('https://api.spacetraders.io/v2/my/contracts'), headers: headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final json = JsonDecoder().convert(response.body) as Map<String, dynamic>;
        final list = json['data'] as List<dynamic>;
        final mapped = list.map((e) => e as Map<String, dynamic>).toList();
        return mapped.map((e) => Contract.fromJson(e)).toList();
      }
      throw (response.body);
    });
  }

  Future<bool> acceptContract(Contract contract) {
    final url = 'https://api.spacetraders.io/v2/my/contracts/${contract.id}/accept';
    return http.post(Uri.parse(url), headers: headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        return true;
      }
      return false;
    });
  }

  Future<List<Waypoint>> getShipyards(String system) {
    final url = 'https://api.spacetraders.io/v2/systems/$system/waypoints?traits=SHIPYARD';
    return http.get(Uri.parse(url), headers: headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final json = JsonDecoder().convert(response.body) as Map<String, dynamic>;
        final list = json['data'] as List<dynamic>;
        final mapped = list.map((e) => e as Map<String, dynamic>);
        return mapped.map((e) => Waypoint.fromJson(e)).toList();
      }
      throw (response);
    });
  }

  Future<Shipyard> getShips(Waypoint waypoint) {
    final url = 'https://api.spacetraders.io/v2/systems/${waypoint.systemSymbol}/waypoints/${waypoint.symbol}/shipyard';
    return http.get(Uri.parse(url), headers: headers).then((response) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        final json = JsonDecoder().convert(response.body) as Map<String, dynamic>;
        final data = json['data'] as Map<String, dynamic>;
        final shipyard = Shipyard.fromJson(data);
        return shipyard;
      }
      throw (response);
    });
  }

  Future<bool> purchaseShip(Waypoint waypoint, String shipType) {
    final url = 'https://api.spacetraders.io/v2/my/ships';
    final body = '{"shipType":"$shipType", "waypointSymbol": "${waypoint.symbol}"}';
    return http.post(Uri.parse(url), headers: headers, body: body).then((response) {
      if (response.statusCode >= 200 && response.statusCode < 300) {
        print(response.body);
        return true;
      }
      throw response;
    });
  }
}
