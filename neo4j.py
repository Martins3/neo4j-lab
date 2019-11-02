import os
import csv
import json
from py2neo import Graph, Node


class Accessory:
    def __init__(self):
        print("init something")
        self.components_entity = []
        self.rels_component_comCats = []
        self.components_cats = []

        self.components_organizations = []
        self.rels_component_organization = []

        self.components_city = []
        self.rels_component_city = []
        self.components_infos = []

    def read_data(self):
        cur_dir = '/'.join(os.path.abspath(__file__).split('/')[:-1])
        self.data_path_a = os.path.join(
            cur_dir, 'yuanqijian_rongrong170000-180000.csv')
        self.data_path_b = os.path.join(
            cur_dir, 'yuanqijian_rongrong180001-190000.csv')

        with open(self.data_path_a, 'r', encoding="utf-8") as csvfile:
            lines = csv.reader(csvfile, delimiter=',')
            for line in lines:
                components_dict = {}
                component_ID = line[3]
                components_dict['ID'] = component_ID
                print(component_ID)

                continue
                self.components_entity.append(component_ID)
                if '质量等级' in line:
                    quality_val = line[line.index('质量等级')+1]
                else:
                    quality_val = '-'
                components_dict['quality'] = quality_val

                if '封装形式' in line:
                    encap_mode = line[line.index('封装形式')+1]
                else:
                    encap_mode = '-'
                components_dict['encap_mode'] = encap_mode

                # 添加分类信息
                if '分类' in line:
                    component_cats = line[5]
                    self.components_cats += [component_cats]
                    self.rels_component_comCats.append(
                        [component_ID, component_cats])
                    if component_cats == '氧化膜电阻器':
                        components_dict['colorLevel'] = '紫色'
                    elif component_cats == '碳膜电阻器':
                        components_dict['colorLevel'] = '红色'
                    elif component_cats == '肖特基二极管':
                        components_dict['colorLevel'] = '橙色'
                    elif component_cats == '谐振器':
                        components_dict['colorLevel'] = '黄色'
                    elif component_cats == '可编程振荡器':
                        components_dict['colorLevel'] = '绿色'
                    elif component_cats == '片式膜电阻器':
                        components_dict['colorLevel'] = '青色'
                    elif component_cats == '普通双极型晶体管':
                        components_dict['colorLevel'] = '蓝色'
                    elif component_cats == '射频同轴电连接器':
                        components_dict['colorLevel'] = '紫色'
                    else:
                        components_dict['colorLevel'] = '-'

                if '生产厂家' in line:
                    component_organizations = line[7]
                    self.components_organizations += [component_organizations]
                    self.rels_component_organization.append(
                        [component_ID, component_organizations])

                if '厂商地域' in line:
                    component_city = line[9]
                    self.components_city += [component_city]
                    self.rels_component_city.append(
                        [component_ID, component_city])

                self.components_infos.append(components_dict)


if __name__ == '__main__':
    acc = Accessory()
    acc.read_data()
    #  handler = MilitaryGraph()
    #  handler.create_graphnodes()
    #  handler.create_graphrels()
    #  handler.export_data()
