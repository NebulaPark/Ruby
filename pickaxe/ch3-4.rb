#변수
# 변수는 객체의 자취를 저장하기 위해 사용된다. 각변수는 객체의 참조를 저장하고 있다.
# 다음 코드에서 이를 확인해 보자.

person = "Tim" #새 문자열 객체 생성, 이 객체에 대한 참조는 지역변수 person에 저장된다.
puts "The object in 'person' is #{person.class}"
puts "The object has an id of #{person.object_id}"
puts "and a value of '#{person}'"

# 변수는 객체인가? 루비에서 그 답은 "아니오"이다. 변수는 단순히 객체에 대한 참조를 가지고 있을 뿐이다. 
# 객체는 커다란 풀 어딘가 (대부분의 경우 힙니다.)를 떠다니고 있을 뿐이고 변수가 그것을 가리키고 있다.

# 조금더 복잡한 예졔를 살펴보자.
person1 = "Tim"
person2 = person1
person1[0] = 'J'

puts "person1 is #{person1}"
puts "person2 is #{person2}"
# 이것으로 부터 변수는 단지 객체에 대한 참조를 가지고 있을 뿐, 객쳬 자체를 담고 있지 않다는 사실을 확인할 수 있다.
# person1을 person2에 대입해도 새로운 객체는 생성되지 않는다. 단지 person1 객체에 대한 참조를 person2로 복사해서 
# person1과 person2가 같은 객체를 참조하도록 만들 뿐이다.

# 대입은 객체의 별명(alias)을 늘려서 결과적으로 여러 개의 변수가 하나의 객체를 참조하로도록 한다.
# 그런데 이러한 점이 코드에서 문제를 일으킬 수 있지 않을까?
# 물론 그럴 수도 있지만, 우리가 생각하는 것 만큼 자누는 아니다(자바 객체로 같은 방식으로 동작한다).
# 예를 들어 앞선 예제에서 다음과 같이 String의 dup 메소드를 사용하면 별명이 늘어 아는 것을 막을 수 있다.
# dup 메소드는 같은 내용을 담은 문자열 객체를 새로 생성하기 때문이다.
person1 = "Tim"
person2 = person1.dup
person1[0] = 'J'

puts "person1 is #{person1}"
puts "person2 is #{person2}"

# 객체를 동경해서 아무도 객체의 상태를 변경할 수 없도록 할 수도 있다. 
# 동결된 객체를 수정하려고 하면 루비는 RuntimeError 예외를 발생시킨다.

person1 = "Tim"
person2 = person1
person1.freeze #객체 수정을 막는다.
person1[0] = 'J'

puts "person1 is #{person1}"
puts "person2 is #{person2}"

# 이 시점에서 루비에서 다루는 모든 것이 객체라는 것과 객체는 클래스로부터 생성되는 인스턴스라는 것을 명심해두자.
# 그리고 객체에 대해 가장 흔하게 하는 작업은 객체들의 컬렉션을 만드는 일이다.