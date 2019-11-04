import os
import csv
import json
from py2neo import Graph, Node


class Accessory:
    def __init__(self):
        print("init something")
        # 三个属性的添加处理
        # 定义链表还是set ?
        self.rels_component_comCats = set()
        self.components_cats = set()

        self.rels_component_organization = set()
        self.components_organizations = set()

        self.rels_component_city = set()
        self.components_city = set()

        self.components_infos = []

        self.g = Graph(
            host="127.0.0.1",  # neo4j 搭载服务器的ip地址，ifconfig可获取到
            http_port=7474,  # neo4j 服务器监听的端口号
            user="neo4j",  # 数据库user name，如果没有更改过，应该是neo4j
            password="tear")

    '''建立没有属性的实体节点'''
    def create_node(self, label, nodes):
        count = 0
        for node_name in nodes:
            node = Node(label, name=node_name)
            self.g.create(node)
            count += 1
            print(count, len(nodes))
        return

    '''创建实体关联边'''
    def create_relationship(self, start_node, end_node, edges, rel_type, rel_name):
        count = 0
        for edge in edges:
            p = edge[0]
            q = edge[1]
            #  print("#############################################")
            print(p)
            print(q)
            #  print(start_node)
            #  print(end_node)
            #  print("#############################################")
            query = "match(p:%s),(q:%s) where p.name='%s'and q.name='%s' create (p)-[rel:%s{name:'%s'}]->(q)" % (
                start_node, end_node, p, q, rel_type, rel_name)
            try:
                self.g.run(query)
                count += 1
                #  print(rel_type, count, all)
            except Exception as e:
                print(e)
        return

    # TODO 重复导入的问题
    '''创建知识图谱中元器件的节点'''  # 在这里定义一个节点的全部属性

    def create_components_nodes(self):
        print("create_components_nodes")
        count = 0
        for component_infos in self.components_infos:
            node = Node("components_ID", name=component_infos['ID'],
                        colorLevel=component_infos['colorLevel'], encap_mode=component_infos['encap_mode'],
                        quality=component_infos['quality'], weight=component_infos['weight'],
                        encap_size=component_infos['encap_size'], temperature=component_infos['temperature'], electric_resistence=component_infos['electric_resistence']
                        )
            self.g.create(node)
            count += 1
            print(count)

        # 创建component中没有属性的实体
        self.create_node('components_cats', self.components_cats)
        self.create_node('components_city', self.components_city)
        self.create_node('components_organizations',
                         self.components_organizations)

        # component中的关系创建
        self.create_relationship('components_ID', 'components_city',
                                 self.rels_component_city, 'rels_component_city', '生产地域')
        self.create_relationship('components_ID', 'components_organizations',
                                 self.rels_component_organization, 'rels_component_organization', '元器件厂商')
        self.create_relationship('components_ID', 'components_cats',
                                 self.rels_component_comCats, 'rels_component_comCats', '元器件类型')

        return

    def read_data(self):
        cur_dir = '/'.join(os.path.abspath(__file__).split('/')[:-1])
        self.data_path_a = os.path.join(
            cur_dir, 'yuanqijian_rongrong170000-180000.csv')
        self.data_path_b = os.path.join(
            cur_dir, 'yuanqijian_rongrong180001-190000.csv')

        # TODO data_path_b 处理
        with open(self.data_path_a, 'r', encoding="utf-8") as csvfile:
            lines = csv.reader(csvfile, delimiter=',')
            for line in lines:
                components_dict = {}
                component_ID = line[3]
                components_dict['ID'] = component_ID
                #  print(component_ID)

                #  self.components_entity.append(component_ID)

                #  if '名称' in line:
                #  name = line[line.index('名称')+1]
                #  else:
                #  name = '-'
                #  components_dict['name'] = name

                # 添加分类信息
                if '分类' in line:
                    component_cats = line[5]
                    self.components_cats.add(component_cats)
                    self.rels_component_comCats.add(
                        (component_ID, component_cats))
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
                    self.components_organizations.add(component_organizations)
                    self.rels_component_organization.add(
                        (component_ID, component_organizations))

                if '厂商地域' in line:
                    component_city = line[9]
                    self.components_city.add(component_city)
                    self.rels_component_city.add(
                        (component_ID, component_city))

                if '封装形式' in line:
                    encap_mode = line[line.index('封装形式')+1]
                else:
                    encap_mode = '-'
                components_dict['encap_mode'] = encap_mode

                if '质量等级' in line:
                    quality_val = line[line.index('质量等级')+1]
                else:
                    quality_val = '-'
                components_dict['quality'] = quality_val

                if '重量' in line:
                    weight_val = line[line.index('重量')+1]
                else:
                    weight_val = '-'
                components_dict['weight'] = weight_val

                if '封装尺寸' in line:
                    encap_size = line[line.index('封装尺寸')+1]
                else:
                    encap_size = '-'
                components_dict['encap_size'] = encap_size

                if '温度范围' in line:
                    temp = line[line.index('温度范围')+1]
                else:
                    temp = '-'
                components_dict['temperature'] = temp

                if '标称阻值' in line:
                    er = line[line.index('标称阻值')+1]
                else:
                    er = '-'
                components_dict['electric_resistence'] = er

                self.components_infos.append(components_dict)


if __name__ == '__main__':
    acc = Accessory()
    acc.read_data()
    acc.create_components_nodes()
    #  handler = MilitaryGraph()
    #  handler.create_graphnodes()
    #  handler.create_graphrels()
    #  handler.export_data()
